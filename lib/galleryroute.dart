import 'package:flutter/material.dart';
import 'photoroute.dart';
import 'getdatafromapi.dart';


class GalleryRoute extends StatefulWidget {
  GalleryRoute({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GalleryRouteState createState() => _GalleryRouteState();
}

class _GalleryRouteState extends State<GalleryRoute> {
  List data;
  final String url = "https://api.unsplash.com/photos/?client_id=bd7Mdah5jWQ_i70fLKYJPCs6N5XDLpsJbJbhpOs0Cjw";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: FutureBuilder(
          future: getDataFromAPI(url),
          builder: (context, snapshot) {
            final List data = snapshot.data;
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Failed to load gallery",
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {

                    Image image =Image.network(
                      data[index]['urls']['thumb'],
                      fit: BoxFit.fill,
                    );

                    Image imageLarge =Image.network(
                      data[index]['urls']['small'],
                      fit: BoxFit.fill,
                    );

                    Text author=Text(
                      data[index]['user']['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );

                    //check if description or alt_description exist
                    Text description=Text("");
                    if ((data[index]['alt_description'])!=null){
                      description=Text(data[index]['alt_description']);
                    } else if ((data[index]['description'])!=null){
                      description=Text(data[index]['description']);
                    }
                    return Container(
                      margin: const EdgeInsets.all(10.0),

                      child: RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            image,
                            author,
                            description,
                          ],
                        ),

                        onPressed: () =>
                            Navigator.push(
                              context, MaterialPageRoute (builder: (context) => PhotoRoute(imageLarge)),
                            ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

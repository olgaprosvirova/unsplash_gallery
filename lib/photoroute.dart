import 'package:flutter/material.dart';

class PhotoRoute extends StatefulWidget {
  final Image image;
  PhotoRoute(this.image);

  @override
  _PhotoRouteState createState() => _PhotoRouteState();
}

class _PhotoRouteState extends State<PhotoRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Chosen Photo"),
      ),
      body: Center (
        child: Container (
          child: widget.image,
            margin: const EdgeInsets.all(10.0),
        ),
      )
    );
  }

}
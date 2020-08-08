import 'package:flutter/material.dart';
import 'galleryroute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(245, 198, 145, 1),
        scaffoldBackgroundColor: Color.fromRGBO(254, 233, 206, 1),
        buttonColor: Color.fromRGBO(240, 220, 220, 1),
      ),
      home: GalleryRoute(title: 'Gallery'),
     );
  }
}

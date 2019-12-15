import 'package:flutter/material.dart';
import 'package:rss_reader/home_screen.dart';

import 'denemehome.dart';

void main() => runApp(RssApp());

class RssApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Haberler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white ,
      ),
      home: HomeScreen(),
      
    );
  }
}

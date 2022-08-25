

import 'package:drhibasaade/Screens/about.dart';
import 'package:flutter/material.dart';

class AboutAppBar extends StatefulWidget{
  @override
  State<AboutAppBar> createState() => _AboutAppBarState();
}

class _AboutAppBarState extends State<AboutAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text("About Us", style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
          ),
        ),
        body: AboutPage(),
    );
  }
}
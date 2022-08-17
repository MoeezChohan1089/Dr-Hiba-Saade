import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget{
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Contact"),
      ),
    );
  }
}
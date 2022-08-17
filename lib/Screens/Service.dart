import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget{
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Service"),
      ),
    );
  }
}
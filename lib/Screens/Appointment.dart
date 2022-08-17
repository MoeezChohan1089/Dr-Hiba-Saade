import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget{
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("Appointment"),
      ),
    );
  }
}
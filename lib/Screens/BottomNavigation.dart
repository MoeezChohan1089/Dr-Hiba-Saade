import 'dart:ui';

import 'package:drhibasaade/Screens/HomePage.dart';
import 'package:drhibasaade/Screens/Service.dart';
import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';

import 'About.dart';
import 'Appointment.dart';
import 'Contact.dart';
import 'Drawer.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _pages = [Home(), AppointmentPage(), ServicePage(), ContactPage()];

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleTabSelection() {
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: AppDrawer(),
      appBar: AppBar(
          leading: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          icon: Image.asset(
            'assets/ic-sidenav.webp',
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
      ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: (_currentIndex == 0)?Text("Home", style: TextStyle(color: Colors.black),):(_currentIndex == 1)?Text("Appointment", style: TextStyle(color: Colors.black)):(_currentIndex == 2)?Text("Service", style: TextStyle(color: Colors.black)):(_currentIndex == 3)?Text("Contact", style: TextStyle(color: Colors.black)):SizedBox(),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.question_mark_outlined, color: Colors.black,),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          )
        ],
      ),
      body: SizedBox.expand(
        child: _pages[_currentIndex],
      ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          fixedColor: Colors.blueAccent,
          onTap: _onItemTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home_rounded, color: _currentIndex == 0? Colors.blueAccent:Colors.black,),
                label: "Home"

            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.pending_actions, color: _currentIndex == 1? Colors.blueAccent:Colors.black),
              label: 'Appointment',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.medical_services, color: _currentIndex == 2? Colors.blueAccent:Colors.black,),
              label: 'Service',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.contact_page_outlined, color: _currentIndex == 3? Colors.blueAccent:Colors.black,),
              label: 'Contact',
            ),
            // BottomNavigationBarItem(
            //   backgroundColor: Colors.red,
            //   icon: Icon(Icons.person),
            //   label: 'Profile',
            // ),
          ],
        ),
    );
  }
}
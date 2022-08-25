
import 'package:drhibasaade/Screens/HomePage.dart';
import 'package:drhibasaade/Screens/service.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'Appointment.dart';
import 'contact.dart';
import 'Drawer.dart';

class MyHomePage extends StatefulWidget {


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [Home(), ServicePage(), ContactPage(), AboutPage()];

  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        title: (_currentIndex == 0)?const Text("Home", style: TextStyle(color: Colors.black),):(_currentIndex == 1)?const Text("Service", style: TextStyle(color: Colors.black)):(_currentIndex == 2)?const Text("Contact", style: TextStyle(color: Colors.black)):(_currentIndex == 3)?const Text("About Us", style: TextStyle(color: Colors.black)):const SizedBox(),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: _pages[_currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentPage()),
          );
        },
      ),
        bottomNavigationBar:
        BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed ,
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
                icon: Icon(Icons.medical_services, color: _currentIndex == 1? Colors.blueAccent:Colors.black,),
                label: 'Service',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.contact_page_outlined, color: _currentIndex == 2? Colors.blueAccent:Colors.black,),
                label: 'Contact',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.error_outline, color: _currentIndex == 3? Colors.blueAccent:Colors.black),
                label: 'About Us',
              ),
              // BottomNavigationBarItem(
              //   backgroundColor: Colors.red,
              //   icon: Icon(Icons.person),
              //   label: 'Profile',
              // ),
            ],
          )
        ),
    );
  }
}
import 'package:drhibasaade/Screens/aboutAppBar.dart';
import 'package:drhibasaade/Screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Dr.Hiba Saadeh', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
            accountEmail: const Text(''),
            currentAccountPicture: CircleAvatar(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/homepage.png')),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.error_outline),
            title: const Text('About Us'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutAppBar()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share'),
            onTap: () {

            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text('Login'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          const Divider(

          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),
          const Divider(
            color: Colors.transparent,
          ),

          const ListTile(
            title: Text('Follow Us', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          ListTile(
            title: const Text('Facebook'),
            leading: const Icon(Icons.facebook_outlined, color: Colors.blue,),
            onTap: () {
              launch('https://hi-in.facebook.com/pg/Dr.HibaSaadeh/videos/');
            },
          ),
          ListTile(
            title: const Text('Instagram'),
            leading: Image.asset('assets/instagram.png', width: 25,),
            onTap: () {
              launch('https://www.instagram.com/dr.hibasaadeh/?utm_medium=copy_link');
            },
          ),
        ],
      ),
    );
  }
}
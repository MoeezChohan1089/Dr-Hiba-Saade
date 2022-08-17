import 'package:drhibasaade/Screens/About.dart';
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
            accountName: Text('Dr.Hiba Saadeh', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
            accountEmail: Text(''),
            currentAccountPicture: CircleAvatar(
              child: Image.asset(
                'assets/logo_image-to-text_dark_7.png',
                fit: BoxFit.cover,
                width: 90,
                height: 90,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                      'assets/homepage.png')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: Icon(Icons.error_outline),
            title: Text('About Us'),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.login_outlined),
            title: Text('Login'),
            onTap: (){

            },
          ),
          Divider(),

          ListTile(
            title: Text('Facebook'),
            leading: Icon(Icons.facebook_outlined, color: Colors.blue,),
            onTap: () {
              launch('https://hi-in.facebook.com/pg/Dr.HibaSaadeh/videos/');
            },
          ),
          ListTile(
            title: Text('Instagram'),
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
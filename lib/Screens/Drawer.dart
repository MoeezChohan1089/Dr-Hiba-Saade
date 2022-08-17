

import 'dart:ui';

import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Drawer(
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueAccent.shade100),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/logo_image-to-text_dark_7.png',
                                width: 50,
                                height: 50,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Dr Hiba Saade',
                                  style: TextStyle(
                                    fontSize: 17,
                                      fontFamily: 'Bolt',
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(builder: (context) => SavedFiles())
                    // );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.home_rounded),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('Home      ', style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 18, fontWeight: FontWeight.bold),),
                          //  Text('Go to Home',style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 15,),)

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    // final Uri params = Uri(
                    //   scheme: 'mailto',
                    //   path: 'ukomrt@gmail.com',
                    //   query:
                    //   'subject=Limit Calculator Feedback', //add subject and body here
                    // );
                    // launchURL(params.toString());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.account_balance_outlined),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('About Us  ', style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 18, fontWeight: FontWeight.bold),),
                           // Text('About Dr',style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 15,),)

                          ],
                        )],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    // if (Platform.isIOS) {
                    //   launch("https://apps.apple.com/us/app/1597722377");
                    // }
                    // // Android
                    // if (Platform.isAndroid) {
                    //   launch(
                    //       "https://play.google.com/store/apps/details?id=com.limit.calculator.solver.steps.solution");
                    // }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.login_outlined),
                        SizedBox(width: 20,),
                        Column(
                          children: [
                            Text('Login', style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 18, fontWeight: FontWeight.bold),),
                            // Text('Customer Support, FAQs',style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 15,),)
                          ],
                        ) ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1))
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Spacer(),
                Container(
                  child: Text("Follow Us", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: (){
                    // if (Platform.isIOS) {
                    //   launch("https://apps.apple.com/us/app/1597722377");
                    // }
                    // // Android
                    // if (Platform.isAndroid) {
                    //   launch(
                    //       "https://play.google.com/store/apps/details?id=com.limit.calculator.solver.steps.solution");
                    // }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.facebook_outlined, color: Colors.blue,),
                        SizedBox(width: 20,),
                        Text('Facebook', style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 18, fontWeight: FontWeight.bold),) ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    // if (Platform.isIOS) {
                    //   launch("https://apps.apple.com/us/app/1597722377");
                    // }
                    // // Android
                    // if (Platform.isAndroid) {
                    //   launch(
                    //       "https://play.google.com/store/apps/details?id=com.limit.calculator.solver.steps.solution");
                    // }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      //   color: Color(0xffF2F2F2),
                    ),
                    child: Row(
                      children: [

                        Container(

                            child: Image.asset('assets/instagram.png', width: 30,)),
                        SizedBox(width: 18,),
                        Text('Instagram', style: TextStyle(color: Theme.of(context).hintColor,fontFamily: 'Bolt',fontSize: 18, fontWeight: FontWeight.bold),) ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
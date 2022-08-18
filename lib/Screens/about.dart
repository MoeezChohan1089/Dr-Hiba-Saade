

import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/landing.png'),
          SizedBox(height: 20,),
          //location
          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.person,color: blackColor,),
                //Space
                SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Name",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          SizedBox(height: 5,),
                          CustomText(
                            title: "Dr. Hiba Saadeh",
                            fontSize: 15,
                            color: greyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),

          SizedBox(height: 20,),

          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.location_on,color: blackColor,),
                //Space
                SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Office",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          SizedBox(height: 5,),
                          CustomText(
                            title: "Dr. Hiba Saadeh Dental Clinic",
                            fontSize: 15,
                            color: greyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Email
          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.mail,color: blackColor,),
                //Space
                SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Email",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          SizedBox(height: 5,),
                          CustomText(
                            title: "info@example.com",
                            fontSize: 15,
                            color: greyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          //Space
          SizedBox(height: 20,),
          //Call
          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.call,color: blackColor,),
                //Space
                SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Call",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          SizedBox(height: 5,),
                          CustomText(
                            title: "+962 795258121",
                            fontSize: 15,
                            color: greyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      )
    );
  }
}
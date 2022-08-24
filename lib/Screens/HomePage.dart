import 'dart:convert';

import 'package:drhibasaade/Model/serivceModel.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/Testimonial_slide.dart';
import 'package:drhibasaade/widgets/custom_button.dart';
import 'package:drhibasaade/widgets/custom_slider.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:drhibasaade/widgets/price_plan_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> showSlider = [];

  @override
  void initState() {
    // TODO: implement initState
    ShowSlider();
    super.initState();
  }


  ShowSlider() async{
    Dio dio = Dio();
    Response response = await dio.get('http://drhibasaadeh.com/api/patients/carousel/', options: Options(headers: {
      "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
      "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
    }));

    if(response.statusCode == 200){
      showSlider = response.data;
      print("response slider: ${showSlider}");
    }else{
      print("Response error");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(
        "Please check your Internet Connection", textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white,),),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        backgroundColor: Color(0xff666666),
        duration: Duration(milliseconds: 1000),));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: (showSlider == null)? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //Slider
            Container(
              padding: kHrPadding,
                child: CustomSlider()),
            //Space
            SizedBox(height: 25,),
            //
            Container(
              padding: kHrPadding,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                      color: Colors.lightBlueAccent
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        CustomText(
                          title: "Opening Hours",
                          fontSize: 22,
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                        ),
                        //Space
                        SizedBox(height: 20,),
                        //
                        Row(
                          children: [
                            CustomText(
                              title: "Mon-Wed:",
                              fontSize: 17,
                              color: whiteColor,
                            ),
                            //Space
                            SizedBox(width: 5,),
                            CustomText(
                              title: "10:00AM - 7:00PM",
                              fontSize: 12,
                              color: whiteColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        //Space
                        SizedBox(height: 12,),
                        //
                        Row(
                          children: [
                            CustomText(
                              title: "Thursday",
                              fontSize: 17,
                              color: whiteColor,
                            ),
                            //Space
                            SizedBox(width: 5,),
                            CustomText(
                              title: "10:00AM - 4:00PM",
                              fontSize: 12,
                              color: whiteColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        //Space
                        SizedBox(height: 12,),
                        //
                        Row(
                          children: [
                            CustomText(
                              title: "Sat - Sun",
                              fontSize: 17,
                              color: whiteColor,
                            ),
                            //Space
                            SizedBox(width: 5,),
                            CustomText(
                              title: "10:00AM - 7:00PM",
                              fontSize: 12,
                              color: whiteColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),

                        SizedBox(height: 15,),
                        //
                        Container(
                          padding: kHrPadding,
                          child: CustomButton(
                            onPressed: () {
                            },
                            btnHeight: 48,
                            btnRadius: 7,
                            title: 'Appointment',
                            fontWeight: FontWeight.w600,
                            btnColor: Colors.blueAccent,
                            textColor: whiteColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Space
                  SizedBox(width: 8,),
                  Container(
                    height: MediaQuery.of(context).size.height*0.30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                        color: Colors.redAccent
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //
                        CustomText(
                          title: "Make Appointment",
                          fontSize: 22,
                          color: whiteColor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        //Space
                        SizedBox(height: 25,),
                        CustomText(
                          title: "Ipsum erat ipsum dolor clita rebum "
                              "no rebum dolores labore, ipsum magna at eos eos amet.",
                          fontSize: 15,
                          color: whiteColor,
                        ),
                        //Space
                        SizedBox(height: 12,),
                        CustomText(
                          title: "+962 795258121",
                          fontSize: 18,
                          color: whiteColor,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //Space
            SizedBox(height: 25,),
            Container(
              padding: kHrPadding,
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "We offer the best quality dental services",
                fontSize: 19,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            //Space
            SizedBox(height: 25,),
            ListView.builder(
                padding: kHrPadding,
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/dentict_img.jpg")
                                )
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            child: CustomText(
                              title: "Cosmetic Dentistry",
                              fontSize: 15,
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            //Space
            SizedBox(height: 25,),
            Container(
              padding: kHrPadding,
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "PRICING PLAN",
                fontSize: 22,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            //Space
            SizedBox(height: 10,),
            Container(
              padding: kHrPadding,
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "We Offer Fair Prices for Dental Treatment",
                fontSize: 19,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            //Space
            SizedBox(height: 25,),

            PricePlanSlider(),

            //Space
            SizedBox(height: 50,),

            testMonialSilde(),
            SizedBox(height: 30,),
          ],
        ),
      )
    );
  }

}
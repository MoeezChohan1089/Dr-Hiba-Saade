import 'package:carousel_slider/carousel_slider.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
class PricePlanSlider extends StatefulWidget {
  const PricePlanSlider({Key? key}) : super(key: key);

  @override
  State<PricePlanSlider> createState() => _PricePlanSliderState();
}  List images =[
  "assets/images/dentict_img.jpg",
  "assets/images/dentict_img.jpg",
  "assets/images/dentict_img.jpg",
];
int currentPage=0;

class _PricePlanSliderState extends State<PricePlanSlider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Slider
          Container(
            height: 390,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8)
            ),
          //  clipBehavior: Clip.hardEdge,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: double.infinity,
                    aspectRatio: 16/10,
                    viewportFraction: 0.84,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    autoPlay: true,
                    onPageChanged: (
                        CarouselPageChangedReason, val) {
                      setState(() {
                        currentPage = CarouselPageChangedReason;
                      });
                    },
                  ),
                  //  carouselController: carouselController,
                  items: images.map((i) {
                    //  currentPage = images!.length-1;
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                        height: 190,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(7),
                                              topLeft: Radius.circular(7),
                                            )
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: Image.asset(i,fit: BoxFit.fill,)),
                                    //
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlueAccent.shade100
                                      ),
                                      child: Column(
                                        children: [
                                          Transform.translate(
                                            offset: Offset(0.0,-30),
                                            child: Card(
                                              elevation: 4,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(7)
                                              ),
                                              child: CustomButton(
                                                onPressed: () {
                                                },
                                                btnHeight: 48,
                                                btnWidth: 100,
                                                btnRadius: 7,
                                                title: '\$200',
                                                fontWeight: FontWeight.w600,
                                                btnColor: Colors.lightBlueAccent.shade100,
                                                textColor: blackColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: Offset(0.0,-15),
                                           child: CustomText(
                                             title: "Coasmetic Dentistry",
                                             color: blackColor,
                                             fontSize: 20,
                                             fontWeight: FontWeight.w700,
                                           ),
                                         ),
                                          //
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 18),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  title: "Modern Equipment",
                                                  fontSize: 14,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                Icon(Icons.check,color: blackColor,)
                                              ],
                                            ),
                                          ),
                                          //Space
                                          SizedBox(height: 10,),
                                          //
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 18),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  title: "Proffessional Dentist",
                                                  fontSize: 14,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                Icon(Icons.check,color: blackColor,)
                                              ],
                                            ),
                                          ),
                                          //Space
                                          SizedBox(height: 10,),
                                          //
                                          Container(
                                            padding: EdgeInsets.symmetric(horizontal: 18),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                CustomText(
                                                  title: "24/7 Call Support",
                                                  fontSize: 14,
                                                  color: blackColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                Icon(Icons.check,color: blackColor,)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),

                              ],
                            )
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 0,
                  end: 0,
                  bottom: -30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)
                        ),
                        child: CustomButton(
                          onPressed: () {
                          },
                          btnHeight: 48,
                          btnWidth: 100,
                          btnRadius: 7,
                          title: 'Appointment',
                          fontWeight: FontWeight.w600,
                          btnColor: Colors.indigo,
                          textColor: whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDot({int? index}){
    return AnimatedContainer(
      width:currentPage==index? 28:8,
      height: 8,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color:currentPage==index?whiteColor: greyColor,
          borderRadius: BorderRadius.circular(4)
      ), duration: Duration(milliseconds: 350),
    );
  }
}

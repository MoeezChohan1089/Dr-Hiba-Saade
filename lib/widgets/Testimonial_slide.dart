import 'package:carousel_slider/carousel_slider.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:flutter/material.dart';

class testMonialSilde extends StatefulWidget{
  @override
  State<testMonialSilde> createState() => _testMonialSildeState();
}

class _testMonialSildeState extends State<testMonialSilde> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 200),
      child: CarouselSlider(
        options: CarouselOptions(
        height: double.infinity,
        aspectRatio: 16/10,
        viewportFraction: 0.84,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
        items: [
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blueAccent.shade700,
              borderRadius: BorderRadius.circular(8)
            ),

            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.white, width: 1,))
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: const Text(
                      "This is very gratefull app",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: const Text(
                    "Moeez Chohan",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.3,
            width: double.maxFinite,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.blueAccent.shade700,
                borderRadius: BorderRadius.circular(8)
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.white, width: 1,))
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.55,
                    child: const Text(
                      "Very Comfortable App And smooth",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: const Text(
                    "Asghar Cheema",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]
      ),
    );
  }

  buildDot({int? index}){
    return AnimatedContainer(
      width:currentPage==index? 28:8,
      height: 8,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          color:currentPage==index?whiteColor: greyColor,
          borderRadius: BorderRadius.circular(4)
      ), duration: const Duration(milliseconds: 350),
    );
  }
}
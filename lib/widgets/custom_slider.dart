import 'package:carousel_slider/carousel_slider.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:flutter/material.dart';
class CustomSlider extends StatefulWidget {
   CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
   List images =[
     "assets/images/dentict_img.jpg",
     "assets/images/dentict_img.jpg",
     "assets/images/dentict_img.jpg",
   ];
int currentPage=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Slider
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: double.infinity,
                    viewportFraction: 0.99,

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
                              //    borderRadius: BorderRadius.circular(7)
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset(i,fit: BoxFit.fill,)
                        );
                      },
                    );
                  }).toList(),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 0,
                  end: 0,
                  bottom: 20,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:List.generate(3, (index){
                        return buildDot(index: index);
                      })
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

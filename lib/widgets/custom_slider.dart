import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:flutter/material.dart';
class CustomSlider extends StatefulWidget {
   const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  List<dynamic> showSlider = [];
  int currentPage=0;

  @override
  void initState() {
    // TODO: implement initState
   ShowSlider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //Slider
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8)
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                CarouselSlider.builder(
                    itemCount: showSlider.length,
                    itemBuilder: (_,index,page){
                      return Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7)
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network("http://drhibasaadeh.com${showSlider[index]['carousel_image']}",fit: BoxFit.fill,)
                      );
                    },
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.98,
                    // aspectRatio: 0.79,
                    initialPage: 0,
                    onPageChanged: (
                        CarouselPageChangedReason, val) {
                      setState(() {
                        currentPage = CarouselPageChangedReason;
                      });
                    },
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  start: 0,
                  end: 0,
                  bottom: 20,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:List.generate(5, (index){
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
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color:currentPage==index?whiteColor: greyColor,
        borderRadius: BorderRadius.circular(4)
      ), duration: const Duration(milliseconds: 350),
    );
  }

ShowSlider() async{
  Dio dio = Dio();
  Response response = await dio.get('http://drhibasaadeh.com/api/patients/carousel/', options: Options(headers: {
    "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
    "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
  }));

  if(response.statusCode == 200){
    setState((){
      showSlider = response.data;
    });
    print("response slider: $showSlider");
  }else{
    print("Response error");
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text(
      "Please check your Internet Connection", textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white,),),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      backgroundColor: Color(0xff666666),
      duration: Duration(milliseconds: 1000),));
  }
}
}

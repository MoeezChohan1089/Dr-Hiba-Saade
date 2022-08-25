import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
class PricePlanSlider extends StatefulWidget {
  const PricePlanSlider({Key? key}) : super(key: key);

  @override
  State<PricePlanSlider> createState() => _PricePlanSliderState();
}
int currentPage=0;

class _PricePlanSliderState extends State<PricePlanSlider> {
  List<dynamic> servicePlan = [];

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      const Duration(seconds: 4),
          () => const Center(child: CircularProgressIndicator()),
    ).then((value) {
      return ShowPlanService();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ShowPlanService(),
        builder: (context, snapshot){
      var data = snapshot.data;
          return (data == null)?
          Stack(
            children: [
              CarouselSlider.builder(
                itemCount: servicePlan.length,
                itemBuilder: (context, index, page){
                  var earthquake = servicePlan[index]['price'];
               //   print("time: $earthquake");
                  return   Stack(
                    children: [
                      Wrap(
                        children: [
                          Container(
                              width: double.infinity,
                              height: 250,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(7),
                                    topLeft: Radius.circular(7),
                                  )
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network('http://drhibasaadeh.com${servicePlan[index]['service_image']}',fit: BoxFit.fill,)),
                          //
                          Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.lightBlueAccent.shade100
                            ),
                            child: Column(
                              children: [
                                Transform.translate(
                                  offset: const Offset(0.0,-30),
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
                                      title: "\$$earthquake",
                                      fontWeight: FontWeight.w600,
                                      btnColor: Colors.lightBlueAccent.shade100,
                                      textColor: blackColor,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Transform.translate(
                                  offset: const Offset(0.0,-15),
                                  child: CustomText(
                                    title: servicePlan[index]['service_name'],
                                    color: blackColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                //
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 18),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        title: servicePlan[index]['service_description'],
                                        fontSize: 14,
                                        color: blackColor,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      const Icon(Icons.check,color: blackColor,)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned.directional(
                        textDirection: Directionality.of(context),
                        start: 0,
                        end: 0,
                        bottom: 30,
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
                      ),
                    ],
                  );


                  //   Stack(
                  //   clipBehavior: Clip.none,
                  //   children: [
                  //
                  //     Positioned.directional(
                  //       textDirection: Directionality.of(context),
                  //       start: 0,
                  //       end: 0,
                  //       bottom: -30,
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Card(
                  //             elevation: 4,
                  //             shape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(7)
                  //             ),
                  //             child: CustomButton(
                  //               onPressed: () {
                  //               },
                  //               btnHeight: 48,
                  //               btnWidth: 100,
                  //               btnRadius: 7,
                  //               title: 'Appointment',
                  //               fontWeight: FontWeight.w600,
                  //               btnColor: Colors.indigo,
                  //               textColor: whiteColor,
                  //               fontSize: 14,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  //
                  // );
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 0.79,
                  initialPage: 0,
                ),
              ),
            ],
          ):const CircularProgressIndicator();
    });
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

  ShowPlanService() async{
    Dio dio = Dio();
    Response response = await dio.get('http://drhibasaadeh.com/api/patients/services/', options: Options(headers: {
      "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
      "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
    }));

    if(response.statusCode == 200){
      setState(() {
        servicePlan = response.data;
      });
     // print("response: $servicePlan");
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

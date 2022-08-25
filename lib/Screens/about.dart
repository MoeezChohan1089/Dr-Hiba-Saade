

import 'package:dio/dio.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget{
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  Map? aboutData;
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(
      const Duration(seconds: 4),
          () => const Center(child: CircularProgressIndicator()),
    ).then((value) {
      return ShowAbout();
    });
    isLoading = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: aboutData == null? const Center(child: CircularProgressIndicator()) : Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('About Us of Hiba Saadeh', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Image.network('http://drhibasaadeh.com/media/uploads/2022/04/04/carousel-1_nwymlkm.jpg'),
          ),
          const SizedBox(height: 20,),
          //location
          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.inbox_outlined,color: blackColor,),
                //Space
                const SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Add Date",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          const SizedBox(height: 5,),
                          CustomText(
                            title: aboutData!['add_date'],
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

          const SizedBox(height: 20,),

          Container(
            padding: kHrPadding,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                const Icon(Icons.outbond_outlined,color: blackColor,),
                //Space
                const SizedBox(width: 20,),
                //
                Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: "Updated Date",
                            fontSize: 20,
                            color: blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          //Space
                          const SizedBox(height: 5,),
                          CustomText(
                            title: aboutData!['update_date'],
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
          const SizedBox(height: 20,),
        ],
      ),

    );
  }

   ShowAbout() async{
    Dio dio = Dio();
    Response response = await dio.get('http://drhibasaadeh.com/api/patients/aboutus/', options: Options(headers: {
      "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
      "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
    }));

    if(response.statusCode == 200){
      aboutData = response.data;
      // map.decoder.toString();
      print("response Data: $aboutData");
      // print("after response: ${}");
      setState(() {
        isLoading = true;
        //   print("after response Data: ${servicePlan}");
      });
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
import 'package:before_after/before_after.dart';
import 'package:dio/dio.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget{
  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  Map? befAfter;

  @override
  void initState() {
    // TODO: implement initState
   BefAfter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: (befAfter == null)? Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //Space
            SizedBox(height: 10,),
            //b
            BeforeAfter(
              beforeImage: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("http://drhibasaadeh.com${befAfter!['before_image']}")
                    )
                ),
                clipBehavior: Clip.hardEdge,
              ),
              afterImage: Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("http://drhibasaadeh.com${befAfter!['after_image']}")
                    )
                ),
                clipBehavior: Clip.hardEdge,
              ),
            ),
            //Space
            SizedBox(height: 20,),
            Container(
              padding: kHrPadding,
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "OUR SERVICES",
                fontSize: 22,
                color: blackColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            //Space
            SizedBox(height: 8,),
            Container(
              padding: kHrPadding,
              alignment: Alignment.centerLeft,
              child: CustomText(
                title: "We offer the best quality dental services",
                fontSize: 17,
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
            )
          ],
        ),
      )
    );
  }

  BefAfter() async{
    Dio dio = Dio();
    Response response = await dio.get('http://drhibasaadeh.com/api/patients/beforeAfterImg/', options: Options(headers: {
      "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
      "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
    }));

    if(response.statusCode == 200){
      setState(() {
        befAfter = response.data;
      });
      print("response slider: ${befAfter!['before_image']}");
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
}
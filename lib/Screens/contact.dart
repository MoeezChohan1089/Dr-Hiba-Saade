import 'package:drhibasaade/provider/location_helper.dart';
import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_button.dart';
import 'package:drhibasaade/widgets/custom_map.dart';
import 'package:drhibasaade/widgets/custom_text.dart';
import 'package:drhibasaade/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget{
  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  Provider.of<LocationHelper>(context,listen: false).autogetInit();
    var   locationHelper =  Provider.of<LocationHelper>(context,listen: false);
    locationHelper.getGeoLocationPosition();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LocationHelper>(
          builder: (context, locationHelper, child){
          return SingleChildScrollView(
            child: Column(
              children: [
                //Space
                SizedBox(height: 20,),
                //Feel Free To Contact Us
                Container(
                  padding: kHrPadding,
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                    title: "Feel Free To Contact Us",
                    fontSize: 24,
                    color: blackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                //Space
                SizedBox(height: 20,),
                //location
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
                                  title: "Our Office",
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
                                  title: "Email Us",
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
                                  title: "Call Us",
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
                //Space
                SizedBox(height: 30,),
                //
                //Email Address
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    //controller: emailController,
                    //validation: loginEmailField,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: kPrimaryColor,
                    textColor: blackColor,
                    textFieldFillColor: mediumBlueColor,
                    onChanged: (_) {
                      return null;
                    },
                    // validation: emailField,
                    hintText: "Your Name",
                    fieldborderRadius: 7,
                    prefixIcon: Icon(Icons.person,color: greyColor,)
                  ),
                ),
                //Space
                const SizedBox(height: 15),
                //Email Address
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    //controller: emailController,
                    //validation: loginEmailField,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      isOutlineInputBorder: true,
                      isOutlineInputBorderColor: kPrimaryColor,
                      textColor: blackColor,
                      textFieldFillColor: mediumBlueColor,
                      onChanged: (_) {
                        return null;
                      },
                      // validation: emailField,
                      hintText: "Your Email",
                      fieldborderRadius: 7,
                      prefixIcon: Icon(Icons.mail,color: greyColor,)
                  ),
                ),
                //Space
                const SizedBox(height: 15),
                //Subject
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    //controller: emailController,
                    //validation: loginEmailField,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      isOutlineInputBorder: true,
                      isOutlineInputBorderColor: kPrimaryColor,
                      textColor: blackColor,
                      textFieldFillColor: mediumBlueColor,
                      onChanged: (_) {
                        return null;
                      },
                      // validation: emailField,
                      hintText: "Subject",
                      fieldborderRadius: 7,
                      prefixIcon: Icon(Icons.accessibility_new_outlined,color: greyColor,)
                  ),
                ),
                //Space
                const SizedBox(height: 15),
                //Message
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomTextField(
                    //controller: emailController,
                    //validation: loginEmailField,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      isOutlineInputBorder: true,
                      maxLines: 6,
                      isOutlineInputBorderColor: kPrimaryColor,
                      textColor: blackColor,
                      textFieldFillColor: mediumBlueColor,
                      onChanged: (_) {
                        return null;
                      },
                      // validation: emailField,
                      hintText: "Message",
                      fieldborderRadius: 7,
                  ),
                ),
                //Space
                const SizedBox(height: 15),
                //Choose file
                Container(
                  padding: kHrPadding,
                  child: Row(
                    children: [
                      CustomButton(
                        onPressed: () {
                        },
                        btnHeight: 48,
                        btnWidth: 100,
                        btnRadius: 7,
                        title: 'Choose file',
                        fontWeight: FontWeight.w600,
                        btnColor: darkBgColor,
                        textColor: blackColor,
                        fontSize: 14,
                      ),
                      //Space
                      SizedBox(width: 6,),
                      Expanded(
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: mediumBlueColor,
                            borderRadius: BorderRadius.circular(7)
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            title: "No file chosen",
                            fontSize: 14,
                            color: greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //Space
                const SizedBox(height: 15),
                //
                Container(
                  padding: kHrPadding,
                  child: CustomButton(
                    onPressed: () {
                    },
                    btnHeight: 48,
                    btnRadius: 7,
                    title: 'Send Message',
                    fontWeight: FontWeight.w600,
                    btnColor: Colors.blueAccent,
                    textColor: whiteColor,
                    fontSize: 14,
                  ),
                ),
                //Space
                const SizedBox(height: 25),
                //map
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Container(
                      height: 220,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6)
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: CustomMap(
                        locationHelper: locationHelper,
                        position: locationHelper.position,
                      )),
                ),
                //Space
                const SizedBox(height: 25),
              ],
            ),
          );
        }
      )
    );
  }
}
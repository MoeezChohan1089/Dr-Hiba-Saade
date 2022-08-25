import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_button.dart';
import 'package:drhibasaade/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:dio/dio.dart';
class AppointmentPage extends StatefulWidget{
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Appointment", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(18),
                alignment: Alignment.center,
                child: const Text("We Are A Certified And Award Winning Dental Clinic You Can Trust.", textAlign: TextAlign.center,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                  controller: fNameController,
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
                    hintText: "First Name",
                    fieldborderRadius: 7,
                    prefixIcon: const Icon(Icons.person,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                  controller: lNameController,
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
                    hintText: "Last Name",
                    fieldborderRadius: 7,
                    prefixIcon: const Icon(Icons.person,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                  controller: mobileController,
                  //validation: loginEmailField,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: kPrimaryColor,
                    textColor: blackColor,
                    textFieldFillColor: mediumBlueColor,
                    onChanged: (_) {
                      return null;
                    },
                    // validation: emailField,
                    hintText: "Your Mobile No",
                    fieldborderRadius: 7,
                    prefixIcon: const Icon(Icons.mobile_friendly,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                  controller: emailController,
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
                    prefixIcon: const Icon(Icons.mail,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                    controller: dateController,
                    //validation: loginEmailField,
                    //   keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: kPrimaryColor,
                    textColor: blackColor,
                    textFieldFillColor: mediumBlueColor,
                    onTap: () async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                          context: context, initialDate: DateTime.now(),
                          firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      // setState(() {
                      //   dateController.text = pickedDate.;
                      // });
                      if(pickedDate != null ){
                        print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(formattedDate);
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dateController.text = formattedDate; //set output date to TextField value.
                        });
                      }else{
                        print("Date is not selected");
                      }
                    },
                    onChanged: (_) {
                      return null;
                    },
                    // validation: emailField,
                    hintText: "Appointment Date",
                    fieldborderRadius: 7,
                    prefixIcon: const Icon(Icons.date_range_outlined,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: CustomTextField(
                     controller: timeController,
                    //validation: loginEmailField,
                    //   keyboardType: TextInputType.datetime,
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                    isOutlineInputBorder: true,
                    isOutlineInputBorderColor: kPrimaryColor,
                    textColor: blackColor,
                    textFieldFillColor: mediumBlueColor,
                    onTap: () async{
                      FocusScope.of(context).requestFocus(FocusNode());
                      _selectTime(context);
                    },
                    onChanged: (_) {
                      return null;
                    },
                    // validation: emailField,
                    hintText: "Time",
                    fieldborderRadius: 7,
                    prefixIcon: const Icon(Icons.access_time,color: greyColor,)
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: kHrPadding,
                child:isLoading?
                Center(child: CircularProgressIndicator()):
                CustomButton(
                  onPressed: () {
                    appointmentService(
                      fName: fNameController.text,
                      lName: lNameController.text,
                      mobileNumber: mobileController.text,
                      emailId: emailController.text,
                      appointDate: dateController.text,
                      appointSlotId: timeController.text,
                    );
                  },
                  btnHeight: 48,
                  btnRadius: 7,
                  title: 'Make Appointment',
                  fontWeight: FontWeight.w600,
                  btnColor: Colors.blueAccent,
                  textColor: whiteColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectTime(BuildContext context) async {
    TimeOfDay selectedTime = TimeOfDay.now();
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null ){
      print(timeOfDay.format(context));   //output 10:51 PM
      String parsedTime = timeOfDay.format(context).toString();
      //converting to DateTime so that we can further format on different pattern.
      print(parsedTime); //output 1970-01-01 22:53:00.000
     // String formattedTime = DateFormat('HH:mm').format(parsedTime);
    //  print(formattedTime); //output 14:59:00
      //DateFormat() is from intl package, you can format the time on any pattern you need.

      setState(() {
        timeController.text = parsedTime; //set the value of text field.
      });
    }else{
      print("Time is not selected");
    }
  }

  Map? appointData;
  bool isLoading = false;
  appointmentService({
    String? fName,
    String? lName,
    String? mobileNumber,
    String? emailId,
    String? appointDate,
    String? appointSlotId,
}) async{
    Dio dio = Dio();
    setState((){
      isLoading = true;
    });
    Map data ={
      "first_name" : fName,
      "last_name" : lName,
      "mobile_no" : mobileNumber,
      "email_id" : emailId,
      "appoint_date": appointDate,
      "app_slot_id": "10"
    };
    Response response = await dio.post('http://drhibasaadeh.com/api/patients/appointment/',
      options: Options(headers: {
        'Content-Type': 'application/json',
      "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
      "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
    }),
      data: data
    );

    if(response.statusCode == 200){
      appointData = response.data;
      // map.decoder.toString();
      print("response Data: ${appointData}");
    //   print("after response: ${}");
      setState(() {
        isLoading = false;
        Navigator.pop(context);
        //   print("after response Data: ${servicePlan}");
      });
    }else{
      print("Response error");
    setState(() {
    isLoading = false;
   // Navigator.pop(context);
    //   print("after response Data: ${servicePlan}");
    });
      print("response Data: ${appointData}");
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
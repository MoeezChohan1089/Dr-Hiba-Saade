import 'package:drhibasaade/utilites/constants.dart';
import 'package:drhibasaade/widgets/custom_button.dart';
import 'package:drhibasaade/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentPage extends StatefulWidget{
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
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
        title: Text("Appointment", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(18),
              alignment: Alignment.center,
              child: Text("We Are A Certified And Award Winning Dental Clinic You Can Trust.", textAlign: TextAlign.center,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 30,
            ),
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
                  hintText: "First Name",
                  fieldborderRadius: 7,
                  prefixIcon: Icon(Icons.person,color: greyColor,)
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
                  hintText: "Last Name",
                  fieldborderRadius: 7,
                  prefixIcon: Icon(Icons.person,color: greyColor,)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: CustomTextField(
                //controller: emailController,
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
                  prefixIcon: Icon(Icons.mobile_friendly,color: greyColor,)
              ),
            ),
            SizedBox(
              height: 20,
            ),
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
            SizedBox(
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
                    FocusScope.of(context).requestFocus(new FocusNode());
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
                      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
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
                  prefixIcon: Icon(Icons.date_range_outlined,color: greyColor,)
              ),
            ),
            SizedBox(
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
                    FocusScope.of(context).requestFocus(new FocusNode());
                    _selectTime(context);
                  },
                  onChanged: (_) {
                    return null;
                  },
                  // validation: emailField,
                  hintText: "Time",
                  fieldborderRadius: 7,
                  prefixIcon: Icon(Icons.access_time,color: greyColor,)
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: kHrPadding,
              child: CustomButton(
                onPressed: () {
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

}
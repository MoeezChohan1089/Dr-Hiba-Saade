import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
             Image.asset(
               'assets/appointment.jpg',
               fit: BoxFit.fill,
               width: double.infinity,
               height: MediaQuery.of(context).size.height,
             ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: Wrap(
                          children: [
                           Row(
                             children: [
                               Expanded(
                                   child: Align(
                                     alignment: Alignment.topLeft,
                                     child: Container(
                                       alignment: Alignment.topLeft,
                                       height: MediaQuery.of(context).size.height *0.15,
                                       child: IconButton(
                                         icon: const Icon(Icons.cancel_outlined),
                                         onPressed: (){
                                           Navigator.of(context).pop();
                                         },
                                       ),
                                     )
                                   )),
                               Expanded(
                                 child: Align(
                                     alignment: Alignment.center,
                                     child: Image.asset('assets/logo.png', width: 120, height: 120,)),
                               ),
                               const Expanded(
                                 child: SizedBox(),
                               )
                             ],
                           ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: ListTile(
                                title: Text(
                                  "Log In",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20, right: 20),
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  color: const Color(0xffF2F2F2),
                                  //   margin:  EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    controller: emailController,
                                    //   cursorColor: Colors.white,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              child: Container(
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  color: const Color(0xffF2F2F2),
                                  //   margin:  EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    controller: passwordController,
                                    //   cursorColor: Colors.white,
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: 25,
                                bottom: 25
                              ),
                              child:isLoading?
                              Center(child: CircularProgressIndicator()): Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width * 0.99,
                                height: 60,
                                //   padding: EdgeInsets.all(15),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      elevation: MaterialStateProperty.all(0),
                                      backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blueAccent),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () async {
                                      loginService(
                                        email: emailController.text.toString(),
                                        password: passwordController.text.toString()
                                      );
                                    },
                                    child: const Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontFamily: "Basic_family",
                                          fontSize: 23.0,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  left: 10,
                  child: Column(
                    children: const [],
                  ))
            ],
          ),
        ));
  }
  Map? userData;
  bool isLoading = false;
  loginService({
    String? email,
    String? password,
  }) async{
    Dio dio = Dio();
    setState((){
      isLoading = true;
    });
    Map data ={
      "email_id" : email,
      "password" : password,
    };
    Response response = await dio.post("http://drhibasaadeh.com/api/patients/login/",
        options: Options(headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer 9944b09199c62bcf9418ad846dd0e4bbdfc6ee4b",
          "Cookie": "csrftoken=96SAAzBY9QG1LVADZLGDkKDFsYpqQ50vZHGZZjOQ6vNfI211OpgMMJ6sd7zFQSSQ; sessionid=dahek6b61n15egs09dhx6ej7x979pq97"
        }),
        data: data
    );

    if(response.statusCode == 200){
      userData = response.data;
      // map.decoder.toString();
      print("response Data: ${userData}");
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
      print("response Data: ${userData}");
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
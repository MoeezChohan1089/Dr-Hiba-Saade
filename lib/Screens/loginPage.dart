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
                                         icon: Icon(Icons.cancel_outlined),
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
                               Expanded(
                                 child: SizedBox(),
                               )
                             ],
                           ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
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
                                  color: Color(0xffF2F2F2),
                                  //   margin:  EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    controller: emailController,
                                    //   cursorColor: Colors.white,
                                    obscureText: false,
                                    decoration: InputDecoration(
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
                                  color: Color(0xffF2F2F2),
                                  //   margin:  EdgeInsets.only(bottom: 8),
                                  child: TextField(
                                    controller: passwordController,
                                    //   cursorColor: Colors.white,
                                    obscureText: true,
                                    decoration: InputDecoration(
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
                              child: Container(
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

                                    },
                                    child: Text(
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
                        color: Colors.white,
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
                    children: [],
                  ))
            ],
          ),
        ));
  }

}
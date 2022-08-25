import 'package:flutter/material.dart';
class CustomImage extends StatelessWidget {
   const CustomImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/preview.png",fit: BoxFit.cover,);
  }
}

import 'package:drhibasaade/Screens/BottomNavigation.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
   late VideoPlayerController _controller;
   late Future<void> initializevideo;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    initializevideo = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();

    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => MyHomePage()),
              (e) => false);
    });
  }

   @override
   void dispose() {
     super.dispose();
     _controller.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity:1.0 ,
              duration: const Duration(milliseconds: 100),
              child: VideoPlayer(_controller),
            )
          ],
        ),
      ),
    );
  }
}
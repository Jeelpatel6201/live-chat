import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:live_chat/main.dart';
import 'package:live_chat/screen/auth/login_screen.dart';
import 'package:live_chat/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(milliseconds: 1500),
      () {

        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Welcome to We Chat"),
          centerTitle: true),
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset("assert/message_sticker.png"),
          ),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text("MADE IN INDIA WITH ❤️",textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}

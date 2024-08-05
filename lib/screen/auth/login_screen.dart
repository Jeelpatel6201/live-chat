import 'package:flutter/material.dart';
import 'package:live_chat/main.dart';
import 'package:live_chat/screen/home_screen.dart';
import 'package:live_chat/service/firebase_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseService firebaseService = FirebaseService();

  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 500),
      () {
        setState(() {
          _isAnimate = true;
        });
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
          AnimatedPositioned(
            top: mq.height * .15,
            width: mq.width * .5,
            right: _isAnimate ? mq.width * .25 : -mq.width * .5,
            duration: const Duration(seconds: 1),
            child: Image.asset("assert/message_sticker.png"),
          ),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .05,
            width: mq.width * .9,
            height: mq.height * .06,
            child: ElevatedButton.icon(
              style:   const ButtonStyle(elevation: WidgetStatePropertyAll(8)),
              onPressed: () {
                firebaseService.verifyGoogleSignInLogin(context);
              },
              label: const Text(
                "Login With Google",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              icon: Image.asset("assert/google_png.webp"),
            ),
          ),
        ],
      ),
    );
  }
}

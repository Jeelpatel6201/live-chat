import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:live_chat/service/firebase_service.dart';
import 'package:live_chat/widget/chat_user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn().signOut();
        },
        child: const Icon(
          Icons.messenger_outline,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("We Chat"),
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection("users").snapshots(),
        builder: (context, snapshot) {
          final data = snapshot.data?.docs;
          if(snapshot.hasData){
            for(var i in data!){
              log("Data:- ${i.data()}" as num);
              // print("Data:- ${i.data()}");
            }
          }
          return ListView.builder(
            itemCount: 20,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return const ChatUserCard();
            },
          );
        },
      ),
    );
  }
}

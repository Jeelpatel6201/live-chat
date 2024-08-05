import 'package:flutter/material.dart';

import '../main.dart';

class ChatUserCard extends StatelessWidget {
  const ChatUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: mq.width * .04,vertical: 4),
      child: InkWell(
        onTap: () {},
        child: const ListTile(

          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          title: Text("Demo User"),
          subtitle: Text("Last Msg"),
          trailing: Text("12:00 PM"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Dialogs {
  static void showSnackBar({context, String? msg}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg ?? ""),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static void showProgressBar({context}) {
    showDialog(
      context: context,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }
}

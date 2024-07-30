import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utility {
  void ShowMyToast(String message) {
    Fluttertoast.showToast(
        fontSize: 16,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green.shade100,
        textColor: Colors.black,
        msg: message);
  }
}

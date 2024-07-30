import 'package:flutter/material.dart';

class ReUseAbleText extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool ispass;
  final Icon icon;

  const ReUseAbleText(
      {super.key,
      required this.controller,
      required this.hintText,
      this.ispass = false,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        fillColor: Colors.grey.shade400,
        filled: true,
        hintText: hintText,
        prefixIcon: icon,
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}

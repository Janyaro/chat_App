import 'package:flutter/material.dart';

class ReUseBtn extends StatelessWidget {
  final String btnTitle;
  final VoidCallback ontap;
  const ReUseBtn({super.key, required this.btnTitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.deepPurple),
        child: Center(
            child: Text(
          btnTitle,
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
    );
  }
}

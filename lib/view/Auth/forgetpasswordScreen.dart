import 'package:firebase_chat_app/Services/auth_services.dart';
import 'package:firebase_chat_app/widgets/ReUseAbleTextField.dart';
import 'package:firebase_chat_app/widgets/Reuse_btn.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final emailController = TextEditingController();
  AuthServices services = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ReUseAbleText(
              controller: emailController,
              hintText: 'Enter email here',
              icon: Icon(Icons.email)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ReUseBtn(
              btnTitle: 'Forget',
              ontap: () {
                services.forgetPassword(emailController.text.toString());
              })
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/Services/auth_services.dart';
import 'package:firebase_chat_app/view/Auth/login_screen.dart';
import 'package:firebase_chat_app/widgets/ReUseAbleTextField.dart';
import 'package:firebase_chat_app/widgets/Reuse_btn.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  CollectionReference firestore = FirebaseFirestore.instance.collection('doc');
  AuthServices services = AuthServices();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image(
                      height: height / 2.3,
                      image: AssetImage('asset/signup.jpeg'))),
              SizedBox(
                height: height * 0.01,
              ),
              ReUseAbleText(
                  controller: nameController,
                  hintText: 'Enter name here',
                  icon: const Icon(Icons.person)),
              SizedBox(
                height: height * 0.02,
              ),
              ReUseAbleText(
                controller: emailController,
                hintText: 'Enter Email here',
                icon: Icon(Icons.email),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ReUseAbleText(
                  controller: passController,
                  hintText: 'Enter Password here',
                  icon: const Icon(Icons.password)),
              SizedBox(
                height: height * 0.02,
              ),
              ReUseBtn(
                btnTitle: 'Sign Up',
                ontap: () {
                  services.isSignUp(
                      context,
                      emailController.text.toString(),
                      passController.text.toString(),
                      nameController.text.toString());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an Account?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

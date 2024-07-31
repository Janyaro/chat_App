import 'package:firebase_chat_app/Services/auth_services.dart';
import 'package:firebase_chat_app/view/Auth/forgetpasswordScreen.dart';
import 'package:firebase_chat_app/view/Auth/signup_screen.dart';
import 'package:firebase_chat_app/widgets/ReUseAbleTextField.dart';
import 'package:firebase_chat_app/widgets/Reuse_btn.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  AuthServices services = AuthServices();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Image(
                        height: height / 2.3,
                        image: AssetImage('asset/login.jpg'))),
                SizedBox(
                  height: height * 0.01,
                ),
                ReUseAbleText(
                  controller: emailController,
                  hintText: 'Enter Email here',
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                ReUseAbleText(
                    controller: passController,
                    hintText: 'Enter Password here',
                    icon: const Icon(Icons.lock)),
                Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordScreen()));
                        },
                        child: const Text(
                          'Forget password',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))),
                SizedBox(
                  height: height * 0.02,
                ),
                ReUseBtn(
                  btnTitle: 'Log In',
                  ontap: () {
                    services.isLogin(context, emailController.text.toString(),
                        passController.text.toString());
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

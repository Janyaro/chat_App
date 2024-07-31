import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/Chat/chatPage.dart';
import 'package:firebase_chat_app/Utility/utils.dart';
import 'package:firebase_chat_app/view/Auth/login_screen.dart';
import 'package:flutter/material.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('userData');

  void isLogin(
    BuildContext context,
    String emailController,
    String passController,
  ) {
    _auth
        .signInWithEmailAndPassword(
            email: emailController, password: passController)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatPageScreen()));
      Utility().ShowMyToast('Login Successfully');
    }).onError((error, stackTrace) {
      Utility().ShowMyToast(error.toString());
    });
  }

  void forgetPassword(String emailController) {
    _auth.sendPasswordResetEmail(email: emailController).then((value) {
      Utility().ShowMyToast('confirm Reset Password Email send to your email ');
    }).onError((error, stackTrace) {
      Utility().ShowMyToast(error.toString());
    });
  }

  void isSignUp(BuildContext context, String emailController,
      String passController, String nameController) {
    _auth
        .createUserWithEmailAndPassword(
            email: emailController, password: passController)
        .then((value) {
      String id = DateTime.now().microsecondsSinceEpoch.toString();
      ref.doc(id).set({
        'Name': nameController,
        'Email': emailController,
        'password': passController
      }).then((value) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        Utility().ShowMyToast('Data Successfully saved in the data');
      }).onError((error, stackTrace) {
        Utility().ShowMyToast(error.toString());
      });
    }).onError((error, stackTrace) {});
  }

  void logout(BuildContext context) {
    _auth.signOut().then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }).onError((error, stackTrace) {
      Utility().ShowMyToast(error.toString());
    });
  }
}

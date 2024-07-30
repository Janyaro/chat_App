import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/Utility/utils.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore =
      FirebaseFirestore.instance.collection('userData') as dynamic;

  void isLogin(String emailController, String passController) {
    _auth
        .signInWithEmailAndPassword(
            email: emailController, password: passController)
        .then((value) {
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
}

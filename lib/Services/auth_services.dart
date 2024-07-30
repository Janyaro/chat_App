import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_chat_app/Utility/utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference ref = FirebaseFirestore.instance.collection('userData');

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

  void isSignUp(
      String emailController, String passController, String nameController) {
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
        Utility().ShowMyToast('Data Successfully saved in the data');
      }).onError((error, stackTrace) {
        Utility().ShowMyToast(error.toString());
      });
    }).onError((error, stackTrace) {});
  }
}

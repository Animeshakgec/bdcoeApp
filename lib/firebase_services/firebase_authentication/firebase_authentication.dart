import 'package:firebase_auth/firebase_auth.dart';
import '/screens/authorization/log_in/user_log_in_screen.dart';
import 'package:flutter/cupertino.dart';
import '/utils/show_snackbar.dart';

Future logIn(TextEditingController emailController,
    TextEditingController passwordController) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    // readPayer();
    // debugPrint('${name}j');
  } on FirebaseAuthException catch (e) {
    debugPrint(e.toString());

    ShowSnackBar(message: e.message.toString());
  }
}

Future signUp(String email, String password) async {
  try {
    // readPayer();
    // debugPrint('${name}k');
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    // readPayer();
    // debugPrint('${name}k');
  } on FirebaseAuthException catch (e) {
    debugPrint(e.toString());

    // ShowSnackBar(message: e.message.toString());
  }
}

Future resetPassword(TextEditingController emailController) async {
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());

    const ShowSnackBar(message: 'Password Reset Email Sent');
  } on FirebaseAuthException catch (e) {
    debugPrint(e.toString());

    ShowSnackBar(message: e.message.toString());
  }
}

// import 'package:big_data/screens/authorization/log_in/member_log_in_screen.dart';
// import 'package:big_data/screens/authorization/sign_up/user_sign_up_screen2.dart';
// import 'package:flutter/material.dart';
// import 'package:big_data/screens/authorization/log_in/user_log_in_screen.dart';
// import 'package:big_data/screens/authorization/sign_up/user_sign_up_screen.dart';
//
// import '../screens/authorization/log_in/user_forgot_password_screen.dart';
// import '../screens/authorization/log_in/member_forgot_password_screen.dart';
//
// class SignUpScreens extends StatefulWidget {
//   const SignUpScreens({Key? key}) : super(key: key);
//
//   @override
//   State<SignUpScreens> createState() => _SignUpScreensState();
// }
//
// class _SignUpScreensState extends State<SignUpScreens> {
//   bool isUser = false;
//   @override
//   Widget build(BuildContext context) {
//     if (isUser) {
//       return const UserSignUpScreen2();
//     } else {
//       return UserSignUpScreen(
//         onClickedFillData: toggle,
//         onClickedSignIn: () {},
//       );
//     }
//   }
//
//   void toggle() => setState(() {
//         isUser = !isUser;
//       });
// }

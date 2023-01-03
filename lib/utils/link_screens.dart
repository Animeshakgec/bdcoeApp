import 'package:big_data/screens/authorization/log_in/member_log_in_screen.dart';
import 'package:big_data/utils/signup_screens.dart';
import 'package:flutter/material.dart';
import 'package:big_data/screens/authorization/log_in/user_log_in_screen.dart';
import 'package:big_data/screens/authorization/sign_up/user_sign_up_screen.dart';

import '../screens/authorization/log_in/user_forgot_password_screen.dart';
import '../screens/authorization/log_in/member_forgot_password_screen.dart';
import '../screens/authorization/sign_up/user_sign_up_screen2.dart';

class LinkScreen extends StatefulWidget {
  const LinkScreen({Key? key}) : super(key: key);

  @override
  State<LinkScreen> createState() => _LinkScreenState();
}

class _LinkScreenState extends State<LinkScreen> {
  bool isLogin = true;
  bool hasPassword = true;
  bool isMember = false;
  bool isUser = false;
  @override
  Widget build(BuildContext context) {
    if (isMember) {
      if (hasPassword) {
        return MemberLoginScreen(
          onMemberClickedSignUp: toggle,
          onMemberClickedPassword: toggle1,
          onClickedSignIn: toggle2,
        );
      } else {
        return MemberForgotPasswordScreen(onMemberClickedSignIn: toggle1);
      }
    } else {
      if (isLogin) {
        if (hasPassword) {
          return UserLoginScreen(
            onClickedSignUp: toggle,
            onClickedPassword: toggle1,
            onMemberClickedLogIn: toggle2,
          );
        } else {
          return ForgotPasswordScreen(onClickedSignIn: toggle1);
        }
      } else {
        if (hasPassword) {
          if (isUser) {
            debugPrint(isUser.toString());
            return const UserSignUpScreen2();
          } else {
            debugPrint(isUser.toString());
            return UserSignUpScreen(
                onClickedFillData: toggle3, onClickedSignIn: toggle);
          }
        } else {
          return ForgotPasswordScreen(onClickedSignIn: toggle1);
        }
      }
    }
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });

  void toggle1() => setState(() {
        hasPassword = !hasPassword;
      });

  void toggle2() => setState(() {
        isMember = !isMember;
      });

  void toggle3() => setState(() {
        isUser = !isUser;
      });
}

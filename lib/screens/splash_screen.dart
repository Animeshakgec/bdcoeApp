import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:big_data/utils/link_screens.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:big_data/views/homepage.dart';
// import '/screens/authorization/main_login_screen.dart';
// import 'authorization/log_in/user_log_in_screen.dart';
import 'home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff052532),
      body: Container(
        // decoration: const BoxDecoration(
        //   backgroundBlendMode: BlendMode.dstIn,
        //   gradient: LinearGradient(
        //     colors: [Color(0x11ffffff), Colors.blueAccent],
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
        child: SafeArea(
          child: AnimatedSplashScreen(
            duration: 00,
            animationDuration: const Duration(milliseconds: 800),
            backgroundColor: const Color(0xff052532),
            splash: 'assets/images/bdcoe_logo.png',
            splashIconSize: MediaQuery.of(context).size.width / 2,
            nextScreen: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong!'));
                } else if (snapshot.hasData) {
                  return const HomeScreen();
                } else {
                  return const LinkScreen();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

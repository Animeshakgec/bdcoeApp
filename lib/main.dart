// import 'package:bdcoe_app/screens/home_screen/home_screen.dart';
// import 'package:bdcoe_app/theme/theme_constants.dart';
// import 'package:bdcoe_app/theme/theme_manager.dart';
import 'package:big_data/firebase_services/fetching_members.dart';

import 'firebase_services/firebase_userdata.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';
// import 'screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  readFacultyUser();
  readMembersUser();
  readCoordinatorsUser();
  fetchMembers();
}

final navigatorKey = GlobalKey<NavigatorState>();

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BDCoE App',
      // theme: lightTheme,
      // darkTheme: darkTheme,
      // themeMode: _themeManager.themeMode,
      home: SplashScreen(),
    );
  }
}

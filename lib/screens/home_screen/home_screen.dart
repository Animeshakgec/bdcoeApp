import 'package:big_data/firebase_services/google_signin.dart';
import 'package:big_data/utils/link_screens.dart';
import 'package:big_data/views/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../main.dart';
import '../../utils/button_style.dart';
import '/screens/events_screen/event_screen.dart';
import '/screens/members_screen/members_screen.dart';
import '/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import '/utils/bottom_nav_bar.dart';

final screens = <Widget>[
  HomePage(),
  const EventsScreen(),
  MembersScreen(),
  const ProfileScreen(),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Scaffold(
        // drawer: Container(
        //   child: Text('hello'),
        // ),
        backgroundColor: const Color(0xff052532),
        body: Builder(builder: (context) {
          return screens.elementAt(index_);
        }),
        // Container(
        //   decoration: const BoxDecoration(
        //     backgroundBlendMode: BlendMode.dstIn,
        //     gradient: LinearGradient(
        //       colors: [Color(0x11ffffff), Colors.blueAccent],
        //       begin: Alignment.topCenter,
        //       end: Alignment.bottomCenter,
        //     ),
        //   ),
        //   child: Center(
        //     child: ElevatedButton(
        //       onPressed: () async {
        //         // showDialog(
        //         //   context: context,
        //         //   barrierDismissible: false,
        //         //   builder: (context) => const Center(
        //         //     child: CircularProgressIndicator(),
        //         //   ),
        //         // );
        //
        //         FirebaseAuth.instance.signOut();
        //         await Navigator.push(context,
        //             MaterialPageRoute(builder: (_) => const LinkScreen()));
        //       },
        //       style: elevatedButtonStyle(context),
        //       child: const Center(
        //         child: Text(
        //           'LOGOUT',
        //           style: TextStyle(
        //             letterSpacing: 1.2,
        //             fontFamily: 'Ubuntu',
        //             fontSize: 23.0,
        //             fontWeight: FontWeight.w500,
        //             color: Colors.blueAccent,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        bottomNavigationBar: navigationBar(
          (index) {
            setState(() {
              index_ = index;
            });
          },
        ),
      ),
    );
  }
}

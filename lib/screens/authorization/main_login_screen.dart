// import '/screens/authorization/log_in/member_log_in_screen.dart';
// import '/screens/authorization/log_in/user_log_in_screen.dart';
// import '/screens/authorization/sign_up/user_sign_up_screen.dart';
// import 'package:flutter/material.dart';
// // import 'package:bdcoe_app/utils/textformfield.dart';
// import '/utils/button_style.dart';
// import '/utils/globals.dart';
// import 'log_in/user_forgot_password_screen.dart';
//
// class MainLoginScreen extends StatefulWidget {
//   const MainLoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MainLoginScreen> createState() => _MainLoginScreenState();
// }
//
// class _MainLoginScreenState extends State<MainLoginScreen> {
//   bool _value = false;
//   bool _value2 = false;
//   bool isMember = false;
//   var tileColour = Colors.white;
//
//   final _userSignInFormKey = GlobalKey<FormState>();
//
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     screenHeight = MediaQuery.of(context).size.height;
//     screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.blueAccent,
//       body: Container(
//         decoration: const BoxDecoration(
//           backgroundBlendMode: BlendMode.dstIn,
//           gradient: LinearGradient(
//             colors: [Color(0x11ffffff), Colors.blueAccent],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Center(
//             child: Form(
//               key: _userSignInFormKey,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(35, 0, 35, 35),
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 35,
//                     ),
//                     const Text(
//                       'BIG DATA',
//                       style: TextStyle(
//                         fontFamily: 'LeagueSpartan',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 53.0,
//                         color: Colors.white,
//                         letterSpacing: 2,
//                         shadows: <Shadow>[
//                           Shadow(
//                             offset: Offset(1.0, 1.0),
//                             blurRadius: 0.0,
//                             color: Colors.white,
//                           ),
//                         ],
//                       ),
//                     ),
//                     const Text(
//                       'Centre of Excellence',
//                       style: TextStyle(
//                         fontFamily: 'LeagueSpartan',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 8,
//                     ),
//                     const Text(
//                       'Describe Identity',
//                       style: TextStyle(
//                         letterSpacing: 1.2,
//                         fontFamily: 'Ubuntu',
//                         fontWeight: FontWeight.w900,
//                         fontSize: 28.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 10,
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height / 2,
//                       child: Column(
//                         children: [
//                           // const Text(
//                           //   'I am :',
//                           //   style: TextStyle(
//                           //     fontFamily: 'Ubuntu',
//                           //     fontWeight: FontWeight.w900,
//                           //     fontSize: 23.0,
//                           //     color: Colors.white,
//                           //   ),
//                           // ),
//                           // const SizedBox(
//                           //   height: 30,
//                           // ),
//                           CheckboxListTile(
//                             tileColor: Colors.blueAccent,
//                             side: const BorderSide(color: Color(0xaaffffff)),
//                             selectedTileColor: const Color(0x31ffffff),
//                             activeColor: const Color(0x00ffffff),
//                             checkColor: Colors.white,
//                             title: const Text(
//                               'I am a BDCoE Member',
//                               style: TextStyle(
//                                 fontFamily: 'Ubuntu',
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             // subtitle: const Text(''),
//                             // secondary: const CircleAvatar(
//                             //   backgroundImage:
//                             //       AssetImage('assets/images/bdcoe_logo.png'),
//                             //   radius: 20,
//                             // ),
//                             autofocus: false,
//                             selected: _value,
//                             // dense: true,
//                             value: _value,
//                             onChanged: (bool? value) {
//                               setState(
//                                 () {
//                                   if (value != null) {
//                                     _value = value;
//                                     _value2 = !value;
//                                     isMember = true;
//                                   }
//                                 },
//                               );
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           CheckboxListTile(
//                             tileColor: Colors.blueAccent,
//                             side: const BorderSide(color: Color(0xaaffffff)),
//                             selectedTileColor: const Color(0x31ffffff),
//                             activeColor: const Color(0x00ffffff),
//                             checkColor: Colors.white,
//                             title: const Text(
//                               'I am not a BDCoE Member',
//                               style: TextStyle(
//                                 fontFamily: 'Ubuntu',
//                                 fontSize: 18,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             // subtitle: const Text(''),
//                             // secondary: const CircleAvatar(
//                             //   backgroundImage:
//                             //       AssetImage('assets/images/bdcoe_logo.png'),
//                             //   radius: 20,
//                             // ),
//                             autofocus: false,
//                             selected: _value2,
//                             // dense: true,
//                             value: _value2,
//                             onChanged: (bool? value) {
//                               setState(
//                                 () {
//                                   if (value != null) {
//                                     _value2 = value;
//                                     _value = !value;
//                                     isMember = false;
//                                   }
//                                 },
//                               );
//                             },
//                           ),
//                           const SizedBox(
//                             height: 50,
//                           ),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (isMember) {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => MemberLoginScreen(
//                                       onMemberClickedPassword: () {},
//                                       onMemberClickedSignUp: () {},
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (_) => UserLoginScreen(
//                                       onClickedSignUp: () {},
//                                       onClickedPassword: () {},
//                                     ),
//                                   ),
//                                 );
//                               }
//                               // signIn();
//                             },
//                             style: elevatedButtonStyle(context),
//                             child: const Center(
//                               child: Text(
//                                 'PROCEED',
//                                 style: TextStyle(
//                                   fontFamily: 'Ubuntu',
//                                   fontSize: 23.0,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.blueAccent,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

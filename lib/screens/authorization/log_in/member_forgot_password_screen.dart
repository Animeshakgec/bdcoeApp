import 'package:google_fonts/google_fonts.dart';

import '/firebase_services/firebase_authentication/firebase_authentication.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/utils/textformfield.dart';
import '/utils/button_style.dart';

class MemberForgotPasswordScreen extends StatefulWidget {
  final VoidCallback onMemberClickedSignIn;
  const MemberForgotPasswordScreen({
    Key? key,
    required this.onMemberClickedSignIn,
  }) : super(key: key);

  @override
  State<MemberForgotPasswordScreen> createState() =>
      _MemberForgotPasswordScreenState();
}

class _MemberForgotPasswordScreenState
    extends State<MemberForgotPasswordScreen> {
  final _memberForgotPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: const Color(0xff052532),
          child: Container(
            height: MediaQuery.of(context).size.height,
            // decoration: const BoxDecoration(
            //   backgroundBlendMode: BlendMode.dstIn,
            //   gradient: LinearGradient(
            //     colors: [Color(0x00ffffff), Colors.blueAccent],
            //     begin: Alignment.topCenter,
            //     end: Alignment.bottomCenter,
            //   ),
            // ),
            child: Center(
              child: Form(
                key: _memberForgotPasswordFormKey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 35),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      Text(
                        'BIG DATA',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 43.0,
                          color: Colors.white,
                          letterSpacing: 2,
                          // shadows: const <Shadow>[
                          //   Shadow(
                          //     offset: Offset(1.5, 1.5),
                          //     blurRadius: 0.0,
                          //     color: Colors.white,
                          //   ),
                          // ],
                        ),
                      ),
                      Text(
                        'Centre of Excellence',
                        style: GoogleFonts.getFont(
                          'Montserrat',
                          fontSize: 17.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 6.5,
                      ),
                      Text(
                        'Get Password Reset Link',
                        style: GoogleFonts.getFont(
                          'Ubuntu',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                        // TextStyle(
                        //   letterSpacing: 1.2,
                        //   fontFamily: 'Ubuntu',
                        //   fontWeight: FontWeight.w900,
                        //   fontSize: 25.0,
                        //   color: Colors.white,
                        // ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 15,
                      ),
                      Row(
                        children: [
                          Text(
                            'Email',
                            textAlign: TextAlign.start,
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      textFormField(
                        emailController,
                        TextInputAction.next,
                        TextInputType.emailAddress,
                        'Email',
                        'Enter your Email',
                        prefixIcon: IconButton(
                          splashRadius: 0.1,
                          color: Colors.white,
                          icon: const Icon(Icons.mail_outline),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: RichText(
                                  text: TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onMemberClickedSignIn,
                                    text: 'Remember Password?',
                                    style: GoogleFonts.getFont(
                                      'Ubuntu',
                                      decorationColor: Colors.white,
                                      fontSize: 13.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                          resetPassword(emailController);
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          widget.onMemberClickedSignIn;
                          // signIn();
                        },
                        style: elevatedButtonStyle(context),
                        child: Center(
                          child: Text(
                            'SEND',
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w500,
                              fontSize: 23.0,
                              color: const Color(0xff052532),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height / 5,
                      // ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         RichText(
                      //           text: const TextSpan(
                      //             style: TextStyle(
                      //               fontFamily: 'Ubuntu',
                      //               fontSize: 14.0,
                      //               color: Colors.white,
                      //             ),
                      //             text: 'Don\'t have an Account ? ',
                      //             children: [
                      //               TextSpan(
                      //                 text: 'Sign Up',
                      //                 style: TextStyle(
                      //                   fontSize: 14.0,
                      //                   fontWeight: FontWeight.bold,
                      //                   color: Color(0xffffffff),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

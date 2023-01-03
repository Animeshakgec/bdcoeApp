import 'package:google_fonts/google_fonts.dart';

import '../../../theme/theme_constants.dart';
import '/firebase_services/firebase_authentication/firebase_authentication.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/utils/textformfield.dart';
import '/utils/button_style.dart';

class ForgotPasswordScreen extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  const ForgotPasswordScreen({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _userForgotPasswordFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff052532),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: const Color(0xff052532),
            child: Container(
              height: MediaQuery.of(context).size.height,
              // decoration: const BoxDecoration(
              //   backgroundBlendMode: BlendMode.dstIn,
              //   gradient: LinearGradient(
              //     colors: [Color(0x11ffffff), Colors.blueAccent],
              //     begin: Alignment.topCenter,
              //     end: Alignment.bottomCenter,
              //   ),
              // ),
              child: Center(
                child: Form(
                  key: _userForgotPasswordFormKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(35, 0, 35, 35),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Text(
                          'BIG DATA',
                          style: GoogleFonts.getFont(
                            'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 43.0,
                            color: Colors.white,
                            letterSpacing: 2,
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
                          TextInputAction.done,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: RichText(
                                    text: TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = widget.onClickedSignIn,
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
                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (context) => const Center(
                            //     child: CircularProgressIndicator(),
                            //   ),
                            // );
                            resetPassword(emailController);
                            var snackBar = SnackBar(
                              content: Text(
                                'Password Reset Link Sent',
                                style: GoogleFonts.getFont(
                                  'Ubuntu',
                                  fontSize: 16,
                                  color: kPrimaryColour,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              backgroundColor: Colors.white,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            // Navigator.of(context)
                            //     .popUntil((route) => route.isFirst);
                            // widget.onClickedSignIn;
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
                      ],
                    ),
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

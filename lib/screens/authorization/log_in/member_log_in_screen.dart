import 'package:big_data/firebase_services/firebase_authentication/firebase_authentication.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../main.dart';
import '/utils/textformfield.dart';
import '/utils/button_style.dart';

class MemberLoginScreen extends StatefulWidget {
  final VoidCallback onMemberClickedSignUp;
  final VoidCallback onMemberClickedPassword;
  final VoidCallback onClickedSignIn;
  const MemberLoginScreen({
    Key? key,
    required this.onMemberClickedSignUp,
    required this.onMemberClickedPassword,
    required this.onClickedSignIn,
  }) : super(key: key);

  @override
  State<MemberLoginScreen> createState() => _MemberLoginScreenState();
}

class _MemberLoginScreenState extends State<MemberLoginScreen> {
  final _memberSignInFormKey = GlobalKey<FormState>();
  final user = FirebaseAuth.instance.currentUser;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                  key: _memberSignInFormKey,
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
                          height: MediaQuery.of(context).size.height / 16.5,
                        ),
                        Text(
                          'Sign In As Member',
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                            fontSize: 28.0,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
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
                          validator: (email) {
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null;
                            return null;
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 35,
                        ),
                        Row(
                          children: [
                            Text(
                              'Password',
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
                        passwordTextFormField(
                          passwordController,
                          TextInputAction.done,
                          TextInputType.phone,
                          'Password',
                          'Enter Password',
                          prefixIcon: IconButton(
                            splashRadius: 0.1,
                            color: Colors.white,
                            icon: const Icon(Icons.key_outlined),
                            onPressed: () {},
                          ),
                          validator: (value) {
                            value != null && value.length < 6
                                ? 'Enter minimum 6 characters'
                                : null;
                            return null;
                          },
                          obscureText: _obscureText,
                          suffixIcon: IconButton(
                            splashRadius: 0.1,
                            color: Colors.white,
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: _toggle,
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
                                        ..onTap =
                                            widget.onMemberClickedPassword,
                                      text: 'Forgot Password?',
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
                            final isValid =
                                _memberSignInFormKey.currentState!.validate();
                            if (!isValid) return;

                            // showDialog(
                            //   context: context,
                            //   barrierDismissible: false,
                            //   builder: (context) => const Center(
                            //     child: CircularProgressIndicator(),
                            //   ),
                            // );

                            logIn(emailController, passwordController);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (_) => const HomeScreen(),
                            //   ),
                            // );
                            navigatorKey.currentState!
                                .popUntil((route) => route.isFirst);
                          },
                          style: elevatedButtonStyle(context),
                          child: Center(
                            child: Text(
                              'LOGIN',
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
                        const SizedBox(
                          height: 10,
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
                                      text: 'Login as User',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
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
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 25,
                        // ),
                        // const SizedBox(
                        //   child: Center(
                        //     child: Text(
                        //       '- OR -',
                        //       style: TextStyle(
                        //         fontFamily: 'Ubuntu',
                        //         fontSize: 17.0,
                        //         // fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 35,
                        // ),
                        // const SizedBox(
                        //   child: Center(
                        //     child: Text(
                        //       'Sign In with',
                        //       style: TextStyle(
                        //         fontFamily: 'Ubuntu',
                        //         fontSize: 15.0,
                        //         // fontWeight: FontWeight.bold,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 50,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.white,
                        //         shadowColor: const Color(0xff000000),
                        //         surfaceTintColor: const Color(0x11ffffff),
                        //         shape: const CircleBorder(
                        //           side: BorderSide(
                        //             color: Colors.white,
                        //             width: 1,
                        //             style: BorderStyle.solid,
                        //           ),
                        //         ),
                        //         elevation: 8.0,
                        //       ),
                        //       child: Container(
                        //         height: 50.0,
                        //         width: 50.0,
                        //         decoration: const BoxDecoration(
                        //           image: DecorationImage(
                        //             image: AssetImage('assets/images/linkedin.png'),
                        //             fit: BoxFit.cover,
                        //           ),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.white,
                        //         shadowColor: const Color(0xff000000),
                        //         surfaceTintColor: const Color(0x11ffffff),
                        //         shape: const CircleBorder(
                        //           side: BorderSide(
                        //             color: Colors.white,
                        //             width: 1,
                        //             style: BorderStyle.solid,
                        //           ),
                        //         ),
                        //         elevation: 8.0,
                        //       ),
                        //       child: Container(
                        //         height: 50.0,
                        //         width: 50.0,
                        //         decoration: const BoxDecoration(
                        //           image: DecorationImage(
                        //             image: AssetImage('assets/images/google.jpg'),
                        //             fit: BoxFit.cover,
                        //           ),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () {},
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Colors.white,
                        //         shadowColor: const Color(0xff000000),
                        //         surfaceTintColor: const Color(0x11ffffff),
                        //         shape: const CircleBorder(
                        //           side: BorderSide(
                        //             color: Colors.white,
                        //             width: 0,
                        //             style: BorderStyle.solid,
                        //           ),
                        //         ),
                        //         elevation: 8.0,
                        //       ),
                        //       child: Container(
                        //         height: 50.0,
                        //         width: 50.0,
                        //         decoration: const BoxDecoration(
                        //           color: Colors.black,
                        //           image: DecorationImage(
                        //             image: AssetImage('assets/images/github.png'),
                        //             fit: BoxFit.cover,
                        //           ),
                        //           shape: BoxShape.circle,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height / 25,
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
                        //                 // recognizer: TapGestureRecognizer()
                        //                 //   ..onTap = widget.onClickedSignUp,
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
      ),
    );
  }
}

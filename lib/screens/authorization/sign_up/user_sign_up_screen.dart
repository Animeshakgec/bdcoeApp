// import '../../../main.dart';
import 'package:big_data/firebase_services/firebase_database/firebase_database.dart';
import 'package:big_data/utils/domains_interested.dart';
import 'package:big_data/utils/link_screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firebase_services/firebase_authentication/firebase_authentication.dart';
import '../../../main.dart';
import '../../../theme/theme_constants.dart';
import '/screens/authorization/sign_up/user_sign_up_screen2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/utils/textformfield.dart';
import '/utils/button_style.dart';
// import '/utils/globals.dart';

class UserSignUpScreen extends StatefulWidget {
  final VoidCallback onClickedSignIn;
  final VoidCallback onClickedFillData;
  const UserSignUpScreen(
      {Key? key,
      required this.onClickedSignIn,
      required this.onClickedFillData})
      : super(key: key);

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final _userSignUpFormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    password2Controller.dispose();
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
      backgroundColor: const Color(0xff052532),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Form(
              key: _userSignUpFormKey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 35, 35),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 65,
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
                      height: MediaQuery.of(context).size.height / 65,
                    ),
                    Text(
                      'Sign Up',
                      style: GoogleFonts.getFont(
                        'Ubuntu',
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w500,
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
                          'Full Name',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFormField(
                      nameController,
                      TextInputAction.next,
                      TextInputType.name,
                      'Full Name',
                      'Enter your Name',
                      textCapitalization: TextCapitalization.words,
                      prefixIcon: IconButton(
                        splashRadius: 0.1,
                        color: Colors.white,
                        icon: const Icon(Icons.person),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone No',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    textFormField(
                      phoneController,
                      TextInputAction.next,
                      TextInputType.phone,
                      'Phone No',
                      'Enter your Phone no',
                      prefixIcon: IconButton(
                        splashRadius: 0.1,
                        color: Colors.white,
                        icon: const Icon(Icons.phone_android_outlined),
                        onPressed: () {},
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Phone Number';
                        } else if (!RegExp(
                                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                          return 'Enter Valid Phone No.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    Row(
                      children: [
                        Text(
                          'Password',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    passwordTextFormField(
                      passwordController,
                      TextInputAction.next,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    Row(
                      children: [
                        Text(
                          'Confirm Password',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    passwordTextFormField(
                      password2Controller,
                      TextInputAction.done,
                      TextInputType.phone,
                      'Confirm Password',
                      'Confirm Password',
                      prefixIcon: IconButton(
                        splashRadius: 0.1,
                        color: Colors.white,
                        icon: const Icon(Icons.key_outlined),
                        onPressed: () {},
                      ),
                      validator: (value) {
                        value != null && value != passwordController.text
                            ? 'Enter the same password as above'
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final isValid =
                            _userSignUpFormKey.currentState!.validate();
                        if (!isValid) return;

                        UserInformation.userName = nameController.text.trim();
                        UserInformation.phoneno = phoneController.text.trim();
                        UserInformation.email = emailController.text.trim();

                        await signUp(emailController.text.trim(),
                            passwordController.text.trim());

                        // navigatorKey.currentState!
                        //     .popUntil((route) => route.isFirst);
                        debugPrint('hello');
                        Future.delayed(const Duration(seconds: 3));
                        if (FirebaseAuth.instance.currentUser != null) {
                          var snackBar = SnackBar(
                            content: Text(
                              'Welcome! ${UserInformation.userName}',
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontSize: 16,
                                color: kPrimaryColour,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const UserSignUpScreen2(),
                            ),
                            (Route<dynamic> route) => false,
                          );
                        } else {
                          var snackBar = SnackBar(
                            content: Text(
                              'Fill the details correctly!',
                              style: GoogleFonts.getFont(
                                'Ubuntu',
                                fontSize: 16,
                                color: kPrimaryColour,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      style: elevatedButtonStyle(context),
                      child: Center(
                        child: Text(
                          'SIGN UP',
                          style: GoogleFonts.getFont(
                            'Ubuntu',
                            letterSpacing: 1.2,
                            fontSize: 23.0,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff052532),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 45,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.getFont(
                                  'Ubuntu',
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                                text: 'Already have an Account ? ',
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = widget.onClickedSignIn,
                                    text: 'Sign In',
                                    style: GoogleFonts.getFont(
                                      'Ubuntu',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

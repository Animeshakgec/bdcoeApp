import 'dart:io';
import 'package:big_data/Screens/home_screen/home_screen.dart';
import 'package:big_data/firebase_services/firebase_database/firebase_database.dart';
import 'package:big_data/firebase_services/firebase_userdata.dart';
import 'package:big_data/screens/authorization/sign_up/user_sign_up_screen.dart';
import 'package:big_data/theme/theme_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../firebase_services/user_data.dart';
import '../../../main.dart';
import '../../../utils/domains_interested.dart';
import '../../../utils/year_of_study.dart';
import '/firebase_services/firebase_authentication/firebase_authentication.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '/utils/textformfield.dart';
import '/utils/button_style.dart';
// import '/utils/upload_image.dart';
// import 'package:file_picker/file_picker.dart';

// import '../../../main.dart';

class UserSignUpScreen2 extends StatefulWidget {
  const UserSignUpScreen2({
    Key? key,
  }) : super(key: key);

  @override
  State<UserSignUpScreen2> createState() => _UserSignUpScreen2State();
}

class _UserSignUpScreen2State extends State<UserSignUpScreen2> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
    postPhotoToFirestore(image!);
  }

  final _userSignUpForm2Key = GlobalKey<FormState>();
  TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
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
              key: _userSignUpForm2Key,
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
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        fontSize: 28.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            if (image != null)
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius:
                                    MediaQuery.of(context).size.width / 5.2 + 4,
                                child: ClipOval(
                                  child: Image.file(
                                    image!,
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    height:
                                        MediaQuery.of(context).size.width / 2.6,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius:
                                    MediaQuery.of(context).size.width / 5.2 + 4,
                                child: ClipOval(
                                    child:
                                        Image.asset('assets/images/user.png')),
                              ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                              onPressed: pickImage,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // padding: const EdgeInsets.symmetric(
                                //     vertical: 20.0, horizontal: 85.0),
                                shadowColor: const Color(0xff000000),
                                surfaceTintColor: const Color(0x11ffffff),
                                // fixedSize: Size(
                                //   MediaQuery.of(context).size.width,
                                //   MediaQuery.of(context).size.height / 18,
                                // ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  // side: const BorderSide(color: Colors.black),
                                ),
                                elevation: 8.0,
                              ),
                              child: image != null
                                  ? Text(
                                      'Change',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: kPrimaryColour,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : Text(
                                      'Choose',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: kPrimaryColour,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        const YearOfStudy(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Stack(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Bio',
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
                              bioController,
                              TextInputAction.done,
                              TextInputType.text,
                              'Bio',
                              'Tell us about yourself',
                              textCapitalization: TextCapitalization.none,
                              prefixIcon: IconButton(
                                splashRadius: 0.1,
                                color: Colors.white,
                                icon: const Icon(Icons.wysiwyg_rounded),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 15,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                UserInformation.bio = bioController.text.trim();
                                UserInformation.uid =
                                    FirebaseAuth.instance.currentUser!.uid;
                                final isValid = _userSignUpForm2Key
                                    .currentState!
                                    .validate();
                                if (!isValid) return;

                                // showDialog(
                                //   context: context,
                                //   barrierDismissible: false,
                                //   builder: (context) => const Center(
                                //     child: CircularProgressIndicator(),
                                //   ),
                                // );

                                final userModel = UserModel(
                                  uid: UserInformation.uid,
                                  userName: UserInformation.userName,
                                  email: UserInformation.email,
                                  domain: UserInformation.domain,
                                  phoneno: UserInformation.phoneno,
                                  bio: UserInformation.bio,
                                  year: UserInformation.year,
                                  imageurl: UserInformation.imageurl,
                                );

                                pushDetailsToFirestore(userModel);

                                if (FirebaseAuth.instance.currentUser != null) {
                                  setState(() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const HomeScreen(),
                                      ),
                                    );
                                  });
                                  navigatorKey.currentState!
                                      .popUntil((route) => route.isFirst);
                                }
                                // navigatorKey.currentState!
                                //     .popUntil((route) => route.isFirst);
                                // createUser(user);
                              },
                              style: elevatedButtonStyle(context),
                              child: Center(
                                child: Text(
                                  'Get Started',
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
                          ],
                        ),
                        const Domains(),
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

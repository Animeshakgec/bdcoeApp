import 'package:big_data/screens/profile_screen/profile_screen.dart';
import 'package:big_data/firebase_services/firebase_userdata.dart';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  String? domain;
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final bio = TextEditingController();

  File? image;

  @override
  Widget build(BuildContext context) {
    Future pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemporary = File(image.path);
        setState(() {
          this.image = imageTemporary;
        });
      } on PlatformException catch (e) {
        debugPrint('Failed to pick image: $e');
      }
    }

    var scheight = MediaQuery.of(context).size.height;
    var scwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff052532),
      appBar: AppBar(
        //shadowColor: Colors.transparent,
        title: const Text('Profile Credentials'),
        backgroundColor: const Color(0xff052532),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        decoration: const BoxDecoration(),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(
                  height: scheight * 0.05,
                ),
                CircleAvatar(
                    radius: scheight * 0.20 / 2,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: GestureDetector(
                        onTap: pickImage,
                        child: (image != null)
                            ? CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: scheight * 0.19 / 2,
                                child: SizedBox(
                                  width: scheight * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () async {
                                          await pickImage();
                                        },
                                        child: CircleAvatar(
                                            radius: scwidth * 0.06,
                                            child:
                                                const Icon(Icons.photo_camera)),
                                      ),
                                    ],
                                  ),
                                ))
                            : CircleAvatar(
                                radius: scheight * 0.19 / 2,
                                backgroundImage:
                                    const AssetImage("assets/images/hand.jpg"),
                                child: SizedBox(
                                  width: scheight * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                          radius: scwidth * 0.06,
                                          child:
                                              const Icon(Icons.photo_camera)),
                                    ],
                                  ),
                                )))),
                //       child: image == null
                // : CircleAvatar(
                //     radius: scheight * 0.19 / 2,
                //     backgroundImage:
                //         AssetImage("assets/images/hand.jpg"),
                //     child: Container(
                //       width: scheight * 0.4 / 2,
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.end,
                //         crossAxisAlignment: CrossAxisAlignment.end,
                //         children: [
                //           CircleAvatar(
                //               child: Icon(Icons.photo_camera)),
                //         ],
                //       ),
                //     ))
                //           : CircleAvatar(
                //               radius: scheight * 0.19 / 2,
                //               backgroundImage: FileImage(image),
                //               child: Container(
                //                 width: scheight * 0.4 / 2,
                //                 child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.end,
                //                   crossAxisAlignment: CrossAxisAlignment.end,
                //                   children: [
                //                     CircleAvatar(
                //                         child: Icon(Icons.photo_camera)),
                //                   ],
                //                 ),
                //               ))),
                //   radius: scheight * 0.2 / 2,
                // ),
                SizedBox(
                  height: scheight * 0.02,
                ),
                // Stack(children: [
                //   Positioned(
                //     left: -30,
                //     right: -30,
                //     child: Container(
                //       width: scwidth,
                //       height: 3,
                //       decoration: const BoxDecoration(
                //           color: Color.fromARGB(255, 255, 255, 255)),
                //     ),
                //   ),
                // ]),
                SizedBox(
                  height: scheight * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Name',
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
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: TextFormField(
                      cursorColor: const Color.fromARGB(255, 255, 255, 255),
                      controller: name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return 'Enter Valid Name';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 218, 219, 220),
                      ),
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 244, 52, 52)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 254, 1, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        hintText: "Enter name",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(169, 227, 222, 222)),

                        //fillColor: Color.fromARGB(243, 217, 197, 226),
                        filled: true,
                        fillColor: Colors.transparent,

                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: IconTheme(
                            data: IconThemeData(
                                color: Color.fromARGB(255, 220, 236, 116)),
                            child: Icon(
                              Icons.person,
                            )),

                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                      keyboardType: TextInputType.name),
                ),
                SizedBox(
                  height: scheight * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Phone No.',
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
                SizedBox(
                  height: scheight * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: TextFormField(
                      controller: phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!RegExp(
                                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                            .hasMatch(value)) {
                          return 'Enter Valid Phone No.';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 218, 219, 220),
                      ),
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 244, 52, 52)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 254, 1, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixText: "+91",
                        prefixStyle: TextStyle(
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 218, 219, 220),
                        ),
                        hintText: "Enter Number",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(169, 227, 222, 222)),

                        //fillColor: Color.fromARGB(243, 217, 197, 226),
                        filled: true,
                        fillColor: Colors.transparent,

                        labelStyle: TextStyle(color: Colors.black),

                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 103, 205, 234)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: IconTheme(
                            data: IconThemeData(
                                color: Color.fromARGB(255, 220, 236, 116)),
                            child: Icon(
                              Icons.phone,
                            )),
                      ),
                      keyboardType: TextInputType.phone),
                ),
                SizedBox(
                  height: scheight * 0.02,
                ),
                Row(
                  children: [
                    Text(
                      'Bio',
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
                SizedBox(
                  height: scheight * 0.02,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: TextFormField(
                      controller: bio,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 218, 219, 220),
                      ),
                      maxLines: 4,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 244, 52, 52)),
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 254, 1, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 103, 205, 234)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),

                        hintText: "Enter Bio",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(169, 227, 222, 222)),

                        //fillColor: Color.fromARGB(243, 217, 197, 226),
                        filled: true,
                        fillColor: Colors.transparent,

                        labelStyle: TextStyle(color: Colors.black),

                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 103, 205, 234)),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        prefixIcon: IconTheme(
                            data: IconThemeData(
                                color: Color.fromARGB(255, 220, 236, 116)),
                            child: Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 80),
                              child: Icon(
                                Icons.account_box_outlined,
                              ),
                            )),
                      ),
                      keyboardType: TextInputType.name),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Domain:",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    Row(children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: const Color.fromARGB(255, 34, 205, 252),
                          title: const Text(
                            "Web Developer",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          value: "Web Developer",
                          groupValue: domain,
                          onChanged: (value) {
                            setState(() {
                              domain = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: const Color.fromARGB(255, 34, 205, 252),
                          title: const Text(
                            "App Developer",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          value: "App Developer",
                          groupValue: domain,
                          onChanged: (value) {
                            setState(() {
                              domain = value.toString();
                            });
                          },
                        ),
                      ),
                    ]),
                    Row(children: [
                      Expanded(
                        child: RadioListTile(
                          activeColor: const Color.fromARGB(255, 34, 205, 252),
                          title: const Text(
                            "Machine Learning",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          value: "Machine Learning",
                          groupValue: domain,
                          onChanged: (value) {
                            setState(() {
                              domain = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          activeColor: const Color.fromARGB(255, 34, 205, 252),
                          title: const Text(
                            "Designer",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          value: "Designer",
                          groupValue: domain,
                          onChanged: (value) {
                            setState(() {
                              domain = value.toString();
                            });
                          },
                        ),
                      ),
                    ])
                  ],
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        postDetailsToFirestore(
                            name, phone, bio, domain, image!);
                        readUser();

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 54, 10, 187),
                        shape: const StadiumBorder()),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

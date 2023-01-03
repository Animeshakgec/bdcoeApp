import 'dart:convert';
import 'dart:io';
import 'package:big_data/firebase_services/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:big_data/firebase_services/firebase_database/firebase_database.dart'
    as UserInformation;
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

postDetailsToFirestore(TextEditingController name, TextEditingController phone,
    TextEditingController bio, String? domain, File image1) async {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  UserModel userModel = UserModel();

  userModel.email = user!.email;
  userModel.uid = user.uid;
  userModel.userName = name.text;
  userModel.bio = bio.text;
  userModel.phoneno = phone.text;
  userModel.domain = domain as List<String>;
  userModel.imageurl = imageurl;

  print("data taken");

  await firebaseFirestore
      .collection("users")
      .doc(user.uid)
      .set(userModel.toMap());
  Reference ref =
      FirebaseStorage.instance.ref().child("users/${user.uid}/profileimage");

  await ref.putFile(File(image1.path));
  await ref.getDownloadURL().then((value) {
    print(value);

    imageurl = value;
  });

  userModel.imageurl = imageurl;

  await firebaseFirestore.collection("users").doc(user.uid).update({
    'imageurl': imageurl,
  });
}

String? userId;

User? user = FirebaseAuth.instance.currentUser;
String imageurl = "";

class UserData extends StatefulWidget {
  UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  UserModel loggedInUser = UserModel();

  @override
  File? image;
  Widget build(BuildContext context) {
    return Scaffold();
  }

  Future pickimageuser() async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 100,
      );
      Reference ref =
          FirebaseStorage.instance.ref().child("${user!.uid}/profileimage");

      await ref.putFile(File(image!.path));
      ref.getDownloadURL().then((value) {
        print(value);

        imageurl = value;
      });

      if (image == null) return;
      final imageTemporary = File(image.path);
      this.image = imageTemporary;
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void initState() {
    User? user = FirebaseAuth.instance.currentUser;

    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
    });
  }
}

_UserDataState imagepick = new _UserDataState();
String imagelink() {
  return imageurl;
}

_UserDataState pickdata = new _UserDataState();

postPhotoToFirestore(File image1) async {
  Reference ref = FirebaseStorage.instance
      .ref()
      .child("users/${FirebaseAuth.instance.currentUser!.uid}/profileimage");

  await ref.putFile(File(image1.path));
  ref.getDownloadURL().then((value) {
    print(value);

    UserInformation.UserInformation.imageurl = value;
  });
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  UserModel userModel = UserModel();
  userModel.imageurl = imageurl;

  await firebaseFirestore
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .update({
    'imageurl': imageurl,
  });
}

UserModel loggedInUser = UserModel();

fetchData() async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) {
    loggedInUser = UserModel.fromMap(value.data());
    print("${loggedInUser.userName},${loggedInUser.bio}");
    return true;
  });
}

void readUser() async {
  final firestoreDB = FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser?.uid.toString());
  final snapshot = await firestoreDB.get();
  if (snapshot.exists) {
    UserDataFetch.userName = snapshot['userName'];
    UserDataFetch.imageurl = snapshot['imageurl'];
    UserDataFetch.bio = snapshot['bio'];
    UserDataFetch.domain = snapshot['domain'];
    UserDataFetch.phoneno = snapshot['phone'];
    UserDataFetch.uid = snapshot['uid'];
    UserDataFetch.email = snapshot['email'];
  }
  return null;
}
// }

pushDetailsToFirestore(UserModel userModel) async {
  await FirebaseFirestore.instance
      .collection("users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set(userModel.toMap());
}

readFacultyUser() async {
  final firestoreDB =
      FirebaseFirestore.instance.collection("faculty").doc('faculty1');
  final snapshot = await firestoreDB.get();
  if (snapshot.exists) {
    FacultyUserData.fname1 = snapshot['fname1'];
    FacultyUserData.fimageurl1 = snapshot['fimageurl1'];
    FacultyUserData.position1 = snapshot['position1'];
    FacultyUserData.linkedin1 = snapshot['linkedin1'];
    FacultyUserData.fname2 = snapshot['fname2'];
    FacultyUserData.fimageurl2 = snapshot['fimageurl2'];
    FacultyUserData.position2 = snapshot['position2'];
    FacultyUserData.linkedin2 = snapshot['linkedin2'];
  }
}

Future readCoordinatorsUser() async {
  final firestoreDB = FirebaseFirestore.instance
      .collection("coordinators")
      .doc("coordinators1");
  final snapshot = await firestoreDB.get();
  if (snapshot.exists) {
    CoordinatorUserData.fname1 = snapshot['fname1'];
    CoordinatorUserData.github1 = snapshot['github1'];
    CoordinatorUserData.domain1 = snapshot['domain1'];
    CoordinatorUserData.year1 = snapshot['year1'];
    CoordinatorUserData.fimageurl1 = snapshot['fimageurl1'];
    CoordinatorUserData.linkedin1 = snapshot['linkedin1'];
    CoordinatorUserData.fname2 = snapshot['fname2'];
    CoordinatorUserData.github2 = snapshot['github2'];
    CoordinatorUserData.domain2 = snapshot['domain2'];
    CoordinatorUserData.year2 = snapshot['year2'];
    CoordinatorUserData.fimageurl2 = snapshot['fimageurl2'];
    CoordinatorUserData.linkedin2 = snapshot['linkedin2'];
    CoordinatorUserData.fname3 = snapshot['fname3'];
    CoordinatorUserData.github3 = snapshot['github3'];
    CoordinatorUserData.domain3 = snapshot['domain3'];
    CoordinatorUserData.year3 = snapshot['year3'];
    CoordinatorUserData.fimageurl3 = snapshot['fimageurl3'];
    CoordinatorUserData.linkedin3 = snapshot['linkedin3'];
    debugPrint(CoordinatorUserData.fname1);
    debugPrint(CoordinatorUserData.domain1);
    debugPrint(CoordinatorUserData.linkedin1);
    debugPrint(CoordinatorUserData.github1);
    debugPrint(CoordinatorUserData.fimageurl1);
  }
}

Future readMembersUser() async {
  final firestoreDB =
      FirebaseFirestore.instance.collection("members").doc("members1");
  final snapshot = await firestoreDB.get();
  if (snapshot.exists) {
    MembersUserData.fname1 = snapshot['fname1'];
    MembersUserData.github1 = snapshot['github1'];
    MembersUserData.domain1 = snapshot['domain1'];
    MembersUserData.year1 = snapshot['year1'];
    MembersUserData.fimageurl1 = snapshot['fimageurl1'];
    MembersUserData.linkedin1 = snapshot['linkedin1'];
    MembersUserData.fname2 = snapshot['fname2'];
    MembersUserData.github2 = snapshot['github2'];
    MembersUserData.domain2 = snapshot['domain2'];
    MembersUserData.year2 = snapshot['year2'];
    MembersUserData.fimageurl2 = snapshot['fimageurl2'];
    MembersUserData.linkedin2 = snapshot['linkedin2'];
    MembersUserData.fname3 = snapshot['fname3'];
    MembersUserData.github3 = snapshot['github3'];
    MembersUserData.domain3 = snapshot['domain3'];
    MembersUserData.year3 = snapshot['year3'];
    MembersUserData.fimageurl3 = snapshot['fimageurl3'];
    MembersUserData.linkedin3 = snapshot['linkedin3'];
    MembersUserData.fname4 = snapshot['fname4'];
    MembersUserData.github4 = snapshot['github4'];
    MembersUserData.domain4 = snapshot['domain4'];
    MembersUserData.year4 = snapshot['year4'];
    MembersUserData.fimageurl4 = snapshot['fimageurl4'];
    MembersUserData.linkedin4 = snapshot['linkedin4'];
    MembersUserData.fname5 = snapshot['fname5'];
    MembersUserData.github5 = snapshot['github5'];
    MembersUserData.domain5 = snapshot['domain5'];
    MembersUserData.year5 = snapshot['year5'];
    MembersUserData.fimageurl5 = snapshot['fimageurl5'];
    MembersUserData.linkedin5 = snapshot['linkedin5'];
    MembersUserData.fname6 = snapshot['fname6'];
    MembersUserData.github6 = snapshot['github6'];
    MembersUserData.domain6 = snapshot['domain6'];
    MembersUserData.year6 = snapshot['year6'];
    MembersUserData.fimageurl6 = snapshot['fimageurl6'];
    MembersUserData.linkedin6 = snapshot['linkedin6'];
  }
  debugPrint(MembersUserData.fname1);
  return null;
}

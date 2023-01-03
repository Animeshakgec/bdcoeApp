import 'package:flutter/material.dart';
// import 'package:locpay/services/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInformation {
  static var userName = '';
  static var email = '';
  static var domain;
  static var phoneno = '';
  static var bio = '';
  static var year = '';
  static var imageurl = '';
  static var uid = '';
}

// class User {
//   final String name;
//   final String email;
//   final String domain;
//   final String phoneno;
//   final String bio;
//   final String year;
//   final String imageurl;
//
//   User({
//     required this.name,
//     required this.email,
//     required this.domain,
//     required this.phoneno,
//     required this.bio,
//     required this.year,
//     required this.imageurl,
//   });
//
//   Map<String, dynamic> toJson() => {
//         'name': name,
//         'email': email,
//         'domain': domain,
//         'phoneno': phoneno,
//         'bio': bio,
//         'year': year,
//         'imageurl': imageurl,
//       };
//
//   static User fromJson(Map<String, dynamic> json) => User(
//         name: json['name'],
//         email: json['email'],
//         domain: json['domain'],
//         phoneno: json['phoneno'],
//         bio: json['bio'],
//         year: json['year'],
//         imageurl: json['imageurl'],
//       );
// }

// Future createUser(User user) async {
//   final docUser = FirebaseFirestore.instance
//       .collection('users')
//       .doc(FirebaseAuth.instance.currentUser?.uid.toString());
//
//   final json = user.toJson();
//
//   await docUser.set(json);
// }

// var name;

void readPayer() async {
  // debugPrint("${UserInformation().name}a");
  // debugPrint("${UserInformation().email}z");
  // UserInformation().name = getName().toString();

  final docPayer = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final snapshot = await docPayer.get();

  if (snapshot.exists) {
    // debugPrint("${globals.name}b");
    UserInformation.userName = snapshot['userName'].toString();
    UserInformation.email = snapshot['email'].toString();
    UserInformation.imageurl = snapshot['imageurl'].toString();
    UserInformation.year = snapshot['year'].toString();
    UserInformation.uid = snapshot['uid'].toString();
    UserInformation.bio = snapshot['bio'].toString();
    UserInformation.phoneno = snapshot['phoneno'].toString();
    UserInformation.domain = snapshot['domain'].toString().split(',');
    debugPrint(snapshot['userName']);
    debugPrint("${UserInformation.imageurl}c");
  }
  return null;
}

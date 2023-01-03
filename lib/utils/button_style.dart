import 'package:flutter/material.dart';

elevatedButtonStyle(BuildContext context) {
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    // padding: const EdgeInsets.symmetric(
    //     vertical: 20.0, horizontal: 85.0),
    shadowColor: const Color(0xff000000),
    surfaceTintColor: const Color(0x11ffffff),
    fixedSize: Size(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height / 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      // side: const BorderSide(color: Colors.black),
    ),
    elevation: 8.0,
  );
}

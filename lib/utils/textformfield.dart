import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '/theme/theme_constants.dart';

void _toggle() {}

textFormField(
  TextEditingController controller,
  TextInputAction textInputAction,
  TextInputType keyboardType,
  String labelText,
  String hintText, {
  dynamic textCapitalization = TextCapitalization.none,
  String? Function(String?)? validator,
  Widget? prefixIcon = const IconButton(
    splashRadius: 0.1,
    splashColor: Color(0x00000000),
    color: Colors.transparent,
    icon: Icon(
      Icons.circle_rounded,
    ),
    onPressed: _toggle,
  ),
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: kTextFormFieldColour,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      // labelText: labelText,
      // labelStyle: const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 17,
      //   color: Colors.white,
      // ),
      // floatingLabelStyle: const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 17,
      //   color: Colors.white,
      // ),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      hintStyle: GoogleFonts.getFont(
        'Ubuntu',
        // textStyle:
        //     const TextStyle(fontFamily: 'LeagueSpartan'),
        // fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: Colors.white24,
      ),
      // const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 16,
      //   color: Colors.white24,
      // ),
      // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      prefixIcon: prefixIcon,
    ),
    keyboardType: TextInputType.emailAddress,
    textCapitalization: textCapitalization,
    textInputAction: textInputAction,
    style: GoogleFonts.getFont(
      'Ubuntu',
      // textStyle:
      //     const TextStyle(fontFamily: 'LeagueSpartan'),
      // fontWeight: FontWeight.bold,
      // fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: Colors.white,
    ),
    // const TextStyle(
    //   color: Colors.white,
    //   fontFamily: 'Ubuntu',
    //   // fontWeight: FontWeight.bold,
    //   fontSize: 16,
    // ),
    cursorColor: Colors.white,
    inputFormatters: [
      FilteringTextInputFormatter.singleLineFormatter,
    ],
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
  );
}

passwordTextFormField(
  TextEditingController controller,
  TextInputAction textInputAction,
  TextInputType keyboardType,
  String labelText,
  String hintText, {
  dynamic textCapitalization = TextCapitalization.none,
  String? Function(String?)? validator,
  Widget? prefixIcon = const IconButton(
    splashRadius: 0.1,
    splashColor: Color(0x00000000),
    color: Colors.transparent,
    icon: Icon(
      Icons.circle_rounded,
    ),
    onPressed: _toggle,
  ),
  Widget? suffixIcon = const IconButton(
    iconSize: 0,
    splashRadius: 0.1,
    splashColor: Color(0x00000000),
    color: Colors.transparent,
    icon: Icon(
      Icons.circle_outlined,
    ),
    onPressed: _toggle,
  ),
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      filled: true,
      fillColor: kTextFormFieldColour,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        borderSide: BorderSide(
          color: Colors.transparent,
        ),
      ),
      // labelText: labelText,
      // labelStyle: const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 17,
      //   color: Colors.white,
      // ),
      // floatingLabelStyle: const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 17,
      //   color: Colors.white,
      // ),
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      hintStyle: GoogleFonts.getFont(
        'Ubuntu',
        // textStyle:
        //     const TextStyle(fontFamily: 'LeagueSpartan'),
        // fontWeight: FontWeight.bold,
        // fontWeight: FontWeight.w500,
        fontSize: 16.0,
        color: Colors.white24,
      ),
      // const TextStyle(
      //   fontFamily: 'Ubuntu',
      //   fontSize: 16,
      //   color: Colors.white24,
      // ),
      // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
    keyboardType: TextInputType.visiblePassword,
    textCapitalization: textCapitalization,
    textInputAction: textInputAction,
    style: GoogleFonts.getFont(
      'Ubuntu',
      // textStyle:
      //     const TextStyle(fontFamily: 'LeagueSpartan'),
      // fontWeight: FontWeight.bold,
      // fontWeight: FontWeight.w500,
      fontSize: 16.0,
      color: Colors.white,
    ),
    // const TextStyle(
    //   color: Colors.white,
    //   fontFamily: 'Ubuntu',
    //   // fontWeight: FontWeight.bold,
    //   fontSize: 16,
    // ),
    cursorColor: Colors.white,
    inputFormatters: [
      FilteringTextInputFormatter.singleLineFormatter,
    ],
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    obscureText: obscureText,
  );
}

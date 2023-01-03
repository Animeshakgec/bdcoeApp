import 'package:flutter/material.dart';

class ShowSnackBar extends StatefulWidget {
  final String message;
  const ShowSnackBar({required this.message, Key? key}) : super(key: key);

  @override
  State<ShowSnackBar> createState() => _ShowSnackBarState();
}

class _ShowSnackBarState extends State<ShowSnackBar> {
  static var messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return showSnackBar(widget.message);
  }
}

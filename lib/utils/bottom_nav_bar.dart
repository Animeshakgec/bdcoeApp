import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fluttericon/brandico_icons.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:fluttericon/iconic_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/typicons_icons.dart';
import '';

// final bottomNavigationKey = GlobalKey<Navi>();

int index_ = 0;

navigationBar(void Function(int) onTap) {
  return BottomNavigationBar(
    elevation: 10,
    iconSize: 15,
    // key: bottomNavigationKey,
    backgroundColor: const Color(0xff052532),
    type: BottomNavigationBarType.fixed,
    // color: Colors.blueAccent,
    // animationCurve: Curves.easeInOut,
    // animationDuration: const Duration(milliseconds: 300),
    onTap: onTap,
    currentIndex: index_,
    unselectedItemColor: const Color(0xaaffffff),
    selectedItemColor: Colors.white,
    selectedLabelStyle: GoogleFonts.getFont(
      'Ubuntu',
      fontSize: 0,
    ),
    unselectedLabelStyle: GoogleFonts.getFont(
      'Ubuntu',
      fontSize: 0,
    ),
    items: [
      BottomNavigationBarItem(
        label: '',
        icon: (index_ == 0)
            ? const Icon(
                Icons.home,
                size: 35,
                color: Colors.white,
              )
            : const Icon(
                Icons.home_outlined,
                size: 30,
                color: const Color(0xaaffffff),
              ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: (index_ == 1)
            ? const Icon(
                Icons.event_available,
                size: 35,
                color: Colors.white,
              )
            : const Icon(
                Icons.event_available_outlined,
                size: 30,
                color: const Color(0xaaffffff),
              ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: (index_ == 2)
            ? const Icon(
                Icons.card_membership,
                size: 35,
                color: Colors.white,
              )
            : const Icon(
                Icons.card_membership_outlined,
                size: 30,
                color: const Color(0xaaffffff),
              ),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: (index_ == 3)
            ? const Icon(
                Icons.account_box,
                size: 35,
                color: Colors.white,
              )
            : const Icon(
                Icons.account_box_outlined,
                size: 30,
                color: const Color(0xaaffffff),
              ),
      ),
    ],
  );
}

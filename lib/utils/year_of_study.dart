import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase_services/firebase_database/firebase_database.dart';
import '../theme/theme_constants.dart';

enum Year {
  I,
  II,
  III,
  IV,
  none,
}

class YearOfStudy extends StatefulWidget {
  const YearOfStudy({Key? key}) : super(key: key);

  @override
  State<YearOfStudy> createState() => _YearOfStudyState();
}

class _YearOfStudyState extends State<YearOfStudy> {
  Year selectedYear = Year.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 2.5,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  UserInformation.year = "I";
                                  selectedYear = Year.I;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 3, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: selectedYear == Year.I
                                      ? Colors.white
                                      : kTextFormFieldColour,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'I',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: selectedYear == Year.I
                                            ? kPrimaryColour
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  UserInformation.year = "II";
                                  selectedYear = Year.II;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(3, 3, 0, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: selectedYear == Year.II
                                      ? Colors.white
                                      : kTextFormFieldColour,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'II',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: selectedYear == Year.II
                                            ? kPrimaryColour
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  UserInformation.year = "III";
                                  selectedYear = Year.III;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 3, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: selectedYear == Year.III
                                      ? Colors.white
                                      : kTextFormFieldColour,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'III',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: selectedYear == Year.III
                                            ? kPrimaryColour
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  UserInformation.year = "IV";
                                  selectedYear = Year.IV;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(3, 3, 0, 3),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: selectedYear == Year.IV
                                      ? Colors.white
                                      : kTextFormFieldColour,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'IV',
                                      style: GoogleFonts.getFont(
                                        'Ubuntu',
                                        fontSize: 16,
                                        color: selectedYear == Year.IV
                                            ? kPrimaryColour
                                            : Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 35,
        ),
        Row(
          children: [
            Text(
              'Year of Study',
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
      ],
    );
  }
}

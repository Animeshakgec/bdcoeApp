import 'package:flutter/material.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/theme_constants.dart';
import 'dropselect.dart';

class Domains extends StatefulWidget {
  const Domains({Key? key}) : super(key: key);

  @override
  State<Domains> createState() => _DomainsState();
}

class _DomainsState extends State<Domains> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Domains of Interest',
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
        GFMultiSelect(
          items: const [
            'Competitive Programming',
            'App Development',
            'Web Development',
            'Machine Learning',
          ],
          onSelect: (value) {
            // print('selected $value ');
          },
          dropdownTitleTileText: 'Select Your Domain(s)',
          dropdownTitleTileTextStyle: GoogleFonts.getFont(
            'Ubuntu',
            fontSize: 16.0,
            color: Colors.white24,
          ),
          dropdownSelectedTileTextStyle: GoogleFonts.getFont(
            'Ubuntu',
            fontSize: 16.0,
            color: Colors.white,
          ),
          dropdownTitleTileColor: Color(0xff16343f),
          listItemTextColor: kPrimaryColour,
          buttonColor: kTextFormFieldColour,
          dropdownBgColor: Color(0xffeeeeee),
          dropdownTitleTilePadding: const EdgeInsets.all(16),
          dropdownUnderlineBorder:
              const BorderSide(color: Colors.transparent, width: 2),
          dropdownTitleTileBorderRadius: BorderRadius.circular(8),
          expandedIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          collapsedIcon: const Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ),
          submitButton: const Text('OK'),
          type: GFCheckboxType.basic,
          activeBgColor: Colors.transparent,
          inactiveBgColor: kTextFormFieldColour,
          inactiveBorderColor: kTextFormFieldColour,
        ),
      ],
    );
  }
}

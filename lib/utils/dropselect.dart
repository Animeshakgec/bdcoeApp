import 'package:big_data/firebase_services/firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class GFMultiSelect<T> extends StatefulWidget {
  /// GF Multiselect let user to select multiple items from the number of
  /// Checkbox ListTile items and display selected items in the TitleTile box.
  /// It displays list of items in the overlay dropdown fashion.
  const GFMultiSelect({
    required this.items,
    required this.onSelect,
    this.initialSelectedItemsIndex,
    this.dropdownTitleTileText = 'Select : ',
    this.dropdownTitleTileTextStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
    this.dropdownSelectedTileTextStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
    this.color,
    this.avatar,
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.size = GFSize.SMALL,
    this.type = GFCheckboxType.basic,
    this.activeBgColor = GFColors.WHITE,
    this.inactiveBgColor = GFColors.WHITE,
    this.activeBorderColor = GFColors.WHITE,
    this.inactiveBorderColor = GFColors.WHITE,
    this.listItemTextColor = GFColors.DARK,
    this.buttonColor = GFColors.PRIMARY,
    this.submitButton,
    this.cancelButton,
    this.expandedIcon = const Icon(
      Icons.keyboard_arrow_down,
      color: Colors.black87,
      size: 30,
    ),
    this.collapsedIcon = const Icon(
      Icons.keyboard_arrow_up,
      color: Colors.black87,
      size: 30,
    ),
    this.dropdownBgColor = Colors.white,
    this.activeIcon = const Icon(
      Icons.check,
      size: 20,
      color: GFColors.DARK,
    ),
    this.inactiveIcon,
    this.customBgColor = GFColors.SUCCESS,
    this.selected = false,
    this.dropdownTitleTileBorder,
    this.dropdownTitleTileBorderRadius =
        const BorderRadius.all(Radius.circular(4)),
    this.dropdownTitleTileColor = GFColors.WHITE,
    this.hideDropdownUnderline = false,
    this.dropdownUnderlineBorder =
        const BorderSide(color: Colors.black45, width: 1),
    this.dropdownTitleTileMargin = const EdgeInsets.all(0),
    this.dropdownTitleTilePadding = const EdgeInsets.all(12),
    this.dropdownTitleTileHintText,
    this.dropdownTitleTileHintTextStyle =
        const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    this.dropdownButton,
    Key? key,
  }) : super(key: key);

  /// defines the list of items the user can select
  final List<dynamic> items;

  ///  A List of items that should be selected at the initial state
  final List<int>? initialSelectedItemsIndex;

  /// callback when user select item from the dropdown,
  /// in callback we get list of selected items index
  final ValueChanged<List<dynamic>> onSelect;

  /// type of [String] to define the dropdownTitleTile  title
  final String dropdownTitleTileText;

  /// type of [TextStyle] to define the textStyle of [dropdownTitleTileText]
  final TextStyle dropdownTitleTileTextStyle;

  /// type of [TextStyle] to define the textStyle of [dropdownTitleTileText]
  final TextStyle dropdownSelectedTileTextStyle;

  /// type of [String] to define the dropdownTitleTile hint text
  final String? dropdownTitleTileHintText;

  /// type of [TextStyle] to define the textStyle of [dropdownTitleTileHintTextStyle]
  final TextStyle dropdownTitleTileHintTextStyle;

  /// defines the border radius  of the dropdownTitleTile
  final BorderRadius dropdownTitleTileBorderRadius;

  /// defines the border of the dropdownTitleTile.
  final Border? dropdownTitleTileBorder;

  /// defines the background color of dropdownButton
  final dynamic dropdownTitleTileColor;

  /// on true state, it hides the Dropdown Underline border
  /// defaults value is false
  final bool hideDropdownUnderline;

  /// defines the border of the Dropdown Underline border
  final BorderSide dropdownUnderlineBorder;

  /// defines the dropdownTitleTile margin
  final EdgeInsets dropdownTitleTileMargin;

  /// defines the dropdownTitleTile padding
  final EdgeInsets dropdownTitleTilePadding;

  /// defines the dropdownTitleTile's trailing icon when dropdown is visible
  final Widget expandedIcon;

  /// defines the dropdownTitleTile's trailing icon when dropdown is not visible
  final Widget collapsedIcon;

  /// defines the submit button in the dropdown
  final Widget? submitButton;

  /// defines the cancel button in the dropdown
  final Widget? cancelButton;

  /// defines dropdown checkbox ListTile's background color. Can be given [Color] or [GFColors]
  final dynamic color;

  /// type of [Widget] or [GFAvatar] used to defines dropdown checkbox ListTile's leading
  final Widget? avatar;

  /// defines the margin of dropdown checkbox ListTile
  final EdgeInsets margin;

  /// defines the padding of dropdown checkbox ListTile
  final EdgeInsets padding;

  /// defines dropdown ListTile's checkbox type
  /// type of [GFCheckboxType] which is of four type is basic, sqaure, circular and custom
  final GFCheckboxType type;

  /// defines dropdown ListTile's checkbox size
  /// type of [double] which is GFSize ie, small, medium and large and can use any double value
  final double size;

  /// defines dropdown ListTile's checkbox background color when its active
  /// type of [Color] used to change the backgroundColor of the active checkbox
  final Color activeBgColor;

  /// defines dropdown ListTile's checkbox background color when its inactive
  /// type of [Color] used to change the backgroundColor of the inactive checkbox
  final Color inactiveBgColor;

  /// defines dropdown ListTile's checkbox border color when its active
  /// type of [Color] used to change the border color of the active checkbox
  final Color activeBorderColor;

  /// defines dropdown ListTile's checkbox border color when its inactive
  /// type of [Color] used to change the border color of the inactive checkbox
  final Color inactiveBorderColor;

  /// defines dropdown ListTile's button background color
  /// type of [Color] used to change the button background color
  final Color buttonColor;

  /// The color for the color of the list item text.
  final Color? listItemTextColor;

  /// defines dropdown ListTile's checkbox's active icon
  /// type of [Widget] used to change the  checkbox's active icon
  final Widget activeIcon;

  /// defines dropdown ListTile's checkbox's inactive icon
  ///type of [Widget] used to change the  checkbox's inactive icon
  final Widget? inactiveIcon;

  /// type of [Color] used to change the background color of the custom active  checkbox only
  final Color customBgColor;

  /// To have the list tile appear selected when the checkbox is checked, pass the same value to both.
  /// Normally, this property is left to its default value, false.
  final bool selected;

  /// defines the background color of the dropdown. Can be given [Color] or [GFColors]
  final Color dropdownBgColor;

  final Widget? dropdownButton;

  @override
  _GFMultiSelectState createState() => _GFMultiSelectState();
}

class _GFMultiSelectState<T> extends State<GFMultiSelect<T>>
    with AutomaticKeepAliveClientMixin {
  final List _selectedTitles = [];
  final List _selectedTitlesIndex = [];
  final List _selectedInd = [0, 0, 0, 0];
  int selectedCount = 0;
  bool showDropdown = false;
  bool showSelectedText = false;
  final _controller = TextEditingController();

  @override
  void initState() {
    if (widget.initialSelectedItemsIndex != null &&
        widget.initialSelectedItemsIndex!.isNotEmpty) {
      for (int x in widget.initialSelectedItemsIndex!) {
        _selectedTitles.add(widget.items[x]);
        _selectedTitlesIndex.add(x);
      }
    }
    super.initState();
  }

  void _onItemSelect(bool selected, int index) {
    if (selected == true) {
      setState(() {
        _selectedTitles.add(widget.items[index]);

        // debugPrint(UserInformation().domain[ind++]);
        _selectedTitlesIndex.add(index);
      });
      if (selectedCount < 4) {
        selectedCount++;
      }
      _selectedInd[index] = 1;
      // String s = _selectedTitles[index].toString().trim();
      // UserInformation.domain[s] = 1;
      // debugPrint('${_selectedTitles[index]}  ');
      // debugPrint('${UserInformation.domain[_selectedTitles[index]]}  ');
    } else {
      // UserInformation.domain = _selectedTitles;
      // for (int i = 0; i <= index; i++) {
      //   debugPrint('${_selectedTitles[i]}  ');
      // }
      if (selectedCount > 0) {
        selectedCount--;
      }
      _selectedInd[index] = 0;

      // String s = _selectedTitles[index].toString().trim();
      // UserInformation.domain[s] = 0;
      // debugPrint('${_selectedTitles[index]}  ');
      // debugPrint('${UserInformation.domain[_selectedTitles[index]]}  ');
      // }
      // UserInformation.domain = _selectedTitles;
      // debugPrint('${_selectedTitles[index]}  ');
      setState(() {
        // debugPrint(UserInformation.domain[ind]);
        // debugPrint(_selectedTitles[index]);
        _selectedTitles.remove(widget.items[index]);
        _selectedTitlesIndex.remove(index);
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget dropdownTile() => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _selectedTitles.isEmpty
                ? Expanded(
                    child: Text(widget.dropdownTitleTileText,
                        style: widget.dropdownTitleTileTextStyle))
                : Expanded(
                    child: (selectedCount > 1)
                        ? Text(
                            '$selectedCount Domains Selected',
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            '$selectedCount Domain Selected',
                            style: GoogleFonts.getFont(
                              'Ubuntu',
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                  ),
            !showDropdown ? widget.expandedIcon : widget.collapsedIcon,
          ],
        );

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              showDropdown = !showDropdown;
              showSelectedText = !showSelectedText;
            });
            String S = _selectedTitles.join(',').toString();
            UserInformation.domain = S.split(',');
          },
          child: Container(
            margin: widget.dropdownTitleTileMargin,
            padding: widget.dropdownTitleTilePadding,
            decoration: BoxDecoration(
                color: widget.dropdownTitleTileColor,
                border: widget.dropdownTitleTileBorder,
                borderRadius: widget.dropdownTitleTileBorderRadius),
            child: Container(
              decoration: BoxDecoration(
                border: widget.hideDropdownUnderline
                    ? const Border(
                        bottom: BorderSide(color: Colors.transparent))
                    : Border(bottom: widget.dropdownUnderlineBorder),
              ),
              child: widget.dropdownTitleTileHintText == null
                  ? dropdownTile()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.dropdownTitleTileHintText}',
                          style: widget.dropdownTitleTileHintTextStyle,
                        ),
                        dropdownTile(),
                        const SizedBox(
                          height: 2,
                        )
                      ],
                    ),
            ),
          ),
        ),
        showDropdown
            ? Container(
                margin: const EdgeInsets.only(top: 2),
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: widget.dropdownBgColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3,
                    )
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                          children: List.generate(
                              widget.items.length,
                              (index) => GFCheckboxListTile(
                                    value: _selectedTitles
                                        .contains(widget.items[index]),
                                    onChanged: (bool selected) {
                                      _controller.text;
                                      _onItemSelect(selected, index);
                                      widget.onSelect(_selectedTitlesIndex);
                                    },
                                    selected: widget.selected,
                                    avatar: widget.avatar,
                                    titleText: widget.items[index],
                                    color: widget.color,
                                    padding: widget.padding,
                                    margin: widget.margin,
                                    size: widget.size,
                                    activeBgColor: widget.activeBgColor,
                                    inactiveIcon: widget.inactiveIcon,
                                    activeBorderColor: widget.activeBorderColor,
                                    inactiveBgColor: widget.inactiveBgColor,
                                    activeIcon: widget.activeIcon,
                                    inactiveBorderColor:
                                        widget.inactiveBorderColor,
                                    listItemTextColor: widget.listItemTextColor,
                                    customBgColor: widget.customBgColor,
                                    // checkColor: widget.checkColor,
                                    type: widget.type,
                                  ))),
                      // widget.dropdownButton ??
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     GFButton(
                      //       color: widget.buttonColor,
                      //       onPressed: () {
                      //         setState(() {
                      //           showDropdown = !showDropdown;
                      //           showSelectedText = !showSelectedText;
                      //           _selectedTitles.clear();
                      //           _selectedTitlesIndex.clear();
                      //         });
                      //       },
                      //       child: widget.cancelButton ??
                      //           const Text('CANCEL'),
                      //     ),
                      //     GFButton(
                      //       color: widget.buttonColor,
                      //       onPressed: () {
                      //         setState(() {
                      //           showDropdown = !showDropdown;
                      //           showSelectedText = !showSelectedText;
                      //         });
                      //       },
                      //       child:
                      //           widget.submitButton ?? const Text('OK'),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

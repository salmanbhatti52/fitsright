// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDownMonthButton extends StatefulWidget {
  const MyDropDownMonthButton({
    Key? key,
    required this.width,
    required this.selection,
  }) : super(key: key);

  final double width;
  final String selection;

  @override
  State<MyDropDownMonthButton> createState() => _MyDropDownMonthButtonState();
}

class _MyDropDownMonthButtonState extends State<MyDropDownMonthButton> {
  List<DropdownMenuItem> getMonth() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String data in month) {
      var newItem = DropdownMenuItem(
        value: data,
        child: Text(data),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    getMonth();
    var size = MediaQuery.of(context).size;
    String? selectedMonth;
    return Container(
      height: size.height * 0.055,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFBDC6D1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.selection,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: size.height * 0.015,
                    color: const Color(0xFF9CA3AF)),
              ),
            ),
            Flexible(
              child: DropdownButton(
                icon: SvgPicture.asset('assets/svgs/birthdaydropdownarrow.svg'),
                iconSize: 20,
                style: GoogleFonts.inter(
                    fontSize: size.height * 0.015,
                    color: const Color(0xFF9CA3AF)),
                underline: Container(
                  color: Colors.transparent,
                ),
                value: selectedMonth,
                items: getMonth(),
                onChanged: (newValue) {
                  setState(() {
                    selectedMonth = newValue!;
                    print(selectedMonth);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> month = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

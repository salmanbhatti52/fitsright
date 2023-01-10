// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class MyDropDownDateButton extends StatefulWidget {
  const MyDropDownDateButton({
    Key? key,
    required this.width,
    required this.selection,
  }) : super(key: key);

  final double width;
  final String selection;

  @override
  State<MyDropDownDateButton> createState() => _MyDropDownDateButtonState();
}

class _MyDropDownDateButtonState extends State<MyDropDownDateButton> {
  String dropdownvalue = 'Date';
  var items = [
    'Date',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.055,
      width: widget.width * 01.3,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFBDC6D1))),
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                hint: Text(
                  'Date',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                icon: SvgPicture.asset('assets/svgs/birthdaydropdownarrow.svg'),
                items: items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF9CA3AF),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
                value: dropdownvalue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                // buttonWidth: 10.h,
                dropdownMaxHeight: 30.h,
                scrollbarThickness: 0,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

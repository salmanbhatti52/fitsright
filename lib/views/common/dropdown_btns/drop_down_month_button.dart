// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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


  String dropdownvalue = 'Jan';
  var items = [
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


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.055,
      width: widget.width,
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
                buttonDecoration: const BoxDecoration(),
                hint: const Text(
                  'Month',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                icon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Container(
                            // color: Colors.yellow,
                            decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.circular(4.h)
                                ),
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                value: dropdownvalue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
                // buttonHeight: 5.h,
                // buttonWidth: 19.h,
                // itemHeight: 5.h,
                dropdownMaxHeight: 30.h,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

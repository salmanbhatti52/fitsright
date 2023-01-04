// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
  List<DropdownMenuItem> getDate() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String data in date) {
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
    getDate();
    var size = MediaQuery.of(context).size;
    String? selectedDate;
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
                value: selectedDate,
                items: getDate(),
                onChanged: (newValue) {
                  setState(() {
                    selectedDate = newValue!;
                    print(selectedDate);
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

const List<String> date = [
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

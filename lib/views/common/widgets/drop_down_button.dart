// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton({
    Key? key,
    required this.width,
    required this.selection,
  }) : super(key: key);

  final double width;
  final String selection;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var item1 = const DropdownMenuItem(
      child: Text(
        '',
      ),
    );
    return Container(
      height: size.height * 0.055,
      width: width,
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
              selection,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                  fontSize: size.height * 0.015,
                  color: const Color(0xFF9CA3AF)),
            )),
            Flexible(
              child: DropdownButton(
                iconSize: 20,
                underline: Container(
                  color: Colors.transparent,
                ),
                items: [item1],
                onChanged: (value) => Text(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

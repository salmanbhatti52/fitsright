// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RectangleimageContainer extends StatelessWidget {
  const RectangleimageContainer({
    Key? key,
    required this.picture,
    required this.gender,
  }) : super(key: key);
  final Widget picture;
  final String gender;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.50,
      width: size.width * 0.43,
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFBDC6D1)),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          picture,
          _verticalSpace(size.height * 0.005),
          Text(
            gender,
            style:
                textStyle(FontWeight.w600, Colors.black, size.height * 0.020),
          )
        ],
      ),
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}


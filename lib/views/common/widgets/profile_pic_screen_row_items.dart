import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePicRowItem extends StatelessWidget {
  const ProfilePicRowItem({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textStyle(
              FontWeight.w400, const Color(0xff818D92), size.height * 0.013),
        ),
        Text(
          overflow: TextOverflow.ellipsis,
          subTitle,
          style: textStyle(
              FontWeight.w600, const Color(0xff000000), size.height * 0.013),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

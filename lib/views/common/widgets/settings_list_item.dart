// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    Key? key,
    required this.trailing,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final Widget trailing;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: size.height * 0.075,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: const Color(0xffEDF2F4),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          style: ListTileStyle.list,
          title: Text(
            title,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w600, fontSize: size.height * 0.019),
          ),
          trailing: trailing,
        ),
      ),
    );
  }
}

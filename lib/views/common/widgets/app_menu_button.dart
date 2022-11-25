// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppMenuButton extends StatelessWidget {
  const AppMenuButton({
    Key? key,
    this.onTap,
  }) : super(key: key);
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        height: height * 0.04,
        width: width * 0.089,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(height * 0.012),
            border:
                Border.all(width: 0.5, color: Colors.grey.withOpacity(0.4))),
        child: const Icon(Icons.menu),
      ),
    );
  }
}

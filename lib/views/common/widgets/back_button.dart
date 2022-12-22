import 'package:flutter/material.dart';

class AppBackBtn extends StatelessWidget {
  const AppBackBtn({
    Key? key,
    this.icon = const Icon(
      Icons.arrow_back_ios_sharp,
      size: 16,
    ),
    this.onTap,
    this.radius,
  }) : super(key: key);

  final Widget? icon;
  final VoidCallback? onTap;
  final double? radius;

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
            // color: AppColors.backBtnColor.withOpacity(0.1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(height * 0.012),
            border:
                Border.all(width: 0.5, color: Colors.grey.withOpacity(0.4))),
        child: (icon),
      ),
    );
  }
}

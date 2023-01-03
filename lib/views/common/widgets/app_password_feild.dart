// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:fits_right/utils/app_colors.dart';

class AppPasswordFeild extends StatefulWidget {
  AppPasswordFeild({
    Key? key,
    required this.hint,
    this.controller,
    this.suffix,
    this.obscure,
    this.validator,
  }) : super(key: key);
  bool? obscure;
  final String hint;
  final TextEditingController? controller;
  final Widget? suffix;
  final String? Function(String?)? validator;

  @override
  State<AppPasswordFeild> createState() => _AppPasswordFeildState();
}

class _AppPasswordFeildState extends State<AppPasswordFeild> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return TextFormField(
      obscureText: widget.obscure!,
      validator: widget.validator,
      cursorColor: AppColors.commonBtnColor,
      controller: widget.controller,
      decoration: InputDecoration(
          constraints:
              BoxConstraints(maxWidth: size.width, minWidth: size.width),
          //  suffix: suffix,
          suffixIcon: widget.suffix,
          hintText: widget.hint,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  width: 0.9,
                  style: BorderStyle.solid,
                  color: Color(0xffBDC6D1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                  width: 0.9,
                  style: BorderStyle.solid,
                  color: AppColors.commonBtnColor)),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
                width: 0.9, style: BorderStyle.solid, color: Color(0xffBDC6D1)),
          )),
    );
  }
}

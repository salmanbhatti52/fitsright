import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../common/widgets/app_text_feild.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class CreateNewPassWord extends StatefulWidget {
  const CreateNewPassWord({super.key});

  @override
  State<CreateNewPassWord> createState() => _CreateNewPassWordState();
}

class _CreateNewPassWordState extends State<CreateNewPassWord> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: _createNewPassWordbody(),
      )),
    );
  }

  Widget _createNewPassWordbody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(flex: 1, child: _backButton()),
            _verticalSpace(size.height * 0.080),
            Flexible(flex: 1, child: _infoText()),
            Flexible(flex: 2, child: _textFeilds()),
            Flexible(flex: 2, child: _confirmButton()),
            const Flexible(flex: 1, child: SizedBox()),
          ],
        ),
      ),
    );
  }

  Widget _backButton() {
    return Row(
      children: [
        AppBackBtn(
          onTap: () => Get.back(),
        ),
      ],
    );
  }

  Widget _infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Create New Password ',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'Please, enter a new password below\ndifferent from the previous password',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.020),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Flexible(
            child: AppTextFeild(
          hint: '',
          suffix: Icon(
            Icons.remove_red_eye_sharp,
            size: 24,
            color: Colors.black,
          ),
        )),
        _verticalSpace(size.height * 0.030),
        const Flexible(
            child: AppTextFeild(
          hint: 'Confirm Password',
          suffix: Icon(
            Icons.remove_red_eye_sharp,
            size: 24,
            color: Colors.black,
          ),
        )),
      ],
    );
  }

  Widget _confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Create new password',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}

import 'package:fits_right/routes/screen_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _otpScreenBody())),
    );
  }

  Widget _otpScreenBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(child: _backButton()),
            _verticalSpace(size.height * 0.040),
            Flexible(child: _infoText()),
            Flexible(child: _countDown()),
            Flexible(child: _otpTextFeild()),
            _verticalSpace(size.height * 0.080),
            Flexible(child: confirmButton()),
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
      children: [
        Text(
          'Verify it’s you ',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'We send a code to ( *****@mail.com ).\nEnter it here to verify your identity ',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.016),
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

  Widget _countDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              '03:00',
              style: textStyle(FontWeight.w700, const Color(0xFF8D99AE),
                  size.height * 0.040),
            ),
            _verticalSpace(size.height * 0.010),
            Text(
              'send again',
              style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                  size.height * 0.016),
            ),
          ],
        ),
      ],
    );
  }

  Widget _otpTextFeild() {
    return OtpTextField(
      enabledBorderColor: Colors.black,
      disabledBorderColor: Colors.grey,
      showFieldAsBox: true,
      borderRadius: BorderRadius.circular(20),
      fieldWidth: 50,
      borderWidth: 0.5,
      focusedBorderColor: AppColors.commonBtnColor,
      keyboardType: TextInputType.number,
    );
  }

  Widget confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.createNewPasswordScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Confirm',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.016),
            ),
          ),
        ),
      ],
    );
  }
}
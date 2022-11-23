import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../widgets/back_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: forgotScreenBody())),
    );
  }

  Widget forgotScreenBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 1, child: backButton()),
            _verticalSpace(size.height * 0.040),
            Flexible(flex: 4, child: appLogo()),
            _verticalSpace(size.height * 0.060),
            Flexible(flex: 1, child: infoText()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: enterEmail()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: confirmButton()),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Row(
      children: const [
        AppBackBtn(),
      ],
    );
  }

  Widget appLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(r'assets/svgs/applogo.svg'),
      ],
    );
  }

  Widget infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Forgot Passsword ',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'Enter your registered email/Phone number below\nto receive security code ',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.016),
        ),
      ],
    );
  }

  Widget enterEmail() {
    return const AppTextFeild(hint: 'Enter Your Email');
  }

  Widget confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.otpScreen),
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

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}

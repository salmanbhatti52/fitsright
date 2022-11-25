import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../common/widgets/app_text_feild.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: _createNewAccountBody(),
      )),
    );
  }

  Widget _createNewAccountBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: _backButton()),
            Flexible(flex: 1, child: _infoText()),
            Flexible(flex: 2, child: _profilePic()),
            Flexible(flex: 4, child: _textFeilds()),
            Flexible(flex: 1, child: _nextButton()),
            Flexible(flex: 1, child: _orText()),
            Flexible(flex: 1, child: _signInWith()),
            Flexible(flex: 1, child: _dontHaveAccText()),
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
          'Create New Account',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          'Welcome back, Sign in to your account',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.016),
        ),
      ],
    );
  }

  Widget _profilePic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          height: size.height * 0.15,
          width: size.width - size.width / 2,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),

              //   borderRadius: BorderRadius.circular(20),
              shape: BoxShape.circle),
          child: SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.09,
              child: SvgPicture.asset(
                r'assets/svgs/personicon.svg',
                fit: BoxFit.fill,
              )),
        ),
      ],
    );
  }

  Widget _textFeilds() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(child: AppTextFeild(hint: 'Full Name')),
        _verticalSpace(size.height * 0.015),
        const Flexible(child: AppTextFeild(hint: 'Email')),
        _verticalSpace(size.height * 0.015),
        const Flexible(child: AppTextFeild(hint: 'Phone Number')),
        _verticalSpace(size.height * 0.015),
        const Flexible(
            child: AppTextFeild(
          hint: 'Password',
          suffix: Icon(Icons.remove_red_eye_sharp),
        )),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      children: [
        Flexible(
          child: MyButton(
              radius: 15,
              color: AppColors.commonBtnColor,
              height: size.height * 0.07,
              width: size.width,
              child: Text(
                'Next',
                style: textStyle(
                    FontWeight.w700, Colors.white, size.height * 0.016),
              )),
        ),
      ],
    );
  }

  Widget _orText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Flexible(
            child: Divider(
          thickness: 1,
        )),
        const SizedBox(
          width: 4,
        ),
        Flexible(
            child: Text(
          'OR',
          style: textStyle(
              FontWeight.w400, const Color(0xFF6B7280), size.height * 0.011),
        )),
        const SizedBox(
          width: 4,
        ),
        const Flexible(
            child: Divider(
          thickness: 1,
        )),
      ],
    );
  }

  Widget _signInWith() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: SvgPicture.asset(r'assets/svgs/fbsvg.svg')),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: SvgPicture.asset(r'assets/svgs/googlesvg.svg')),
        const SizedBox(
          width: 20,
        ),
        Flexible(child: SvgPicture.asset(r'assets/svgs/applesvg.svg')),
      ],
    );
  }

  Widget _dontHaveAccText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont have an account?',
          style: textStyle(
              FontWeight.normal, const Color(0xFF6B7280), size.height * 0.016),
        ),
        const SizedBox(
          width: 1,
        ),
        Text(
          'Sign Up',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.016),
        ),
      ],
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}
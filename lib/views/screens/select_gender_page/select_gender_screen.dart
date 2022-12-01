import 'package:fits_right/views/common/widgets/rectangle_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/screen_names.dart';
import '../../../../utils/app_colors.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: _selectGenderBody(),
      )),
    );
  }

  Widget _selectGenderBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: _backButton()),
            Flexible(flex: 3, child: _mainSvg()),
            Flexible(flex: 1, child: _infoText()),
            _verticalSpace(size.height * 0.05),
            Flexible(flex: 2, child: _selectGender()),
            _verticalSpace(size.height * 0.05),
            Flexible(flex: 1, child: _nextButton()),
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

  Widget _mainSvg() {
    return SizedBox(
      height: size.height * 0.5,
      child: SvgPicture.asset(
        r'assets/svgs/selectgenderpgsvg.svg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What’s your gender?',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          'Please choose your Gender. This will be used to identify your needs.',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.021),
        ),
      ],
    );
  }

  Widget _selectGender() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: RectangleimageContainer(
              picture: SvgPicture.asset(r'assets/svgs/selectgenderpgsvg2.svg'),
              gender: 'Male'),
        ),
        Flexible(
            child: RectangleimageContainer(
                picture:
                    SvgPicture.asset(r'assets/svgs/selectgenderpgsvg3.svg'),
                gender: ' Female')),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.selectBirthdayScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Next',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/screen_names.dart';
import '../../../../utils/app_colors.dart';
import '../../common/dropdown_btns/drop_down_date_button.dart';
import '../../common/dropdown_btns/drop_down_month_button.dart';
import '../../common/dropdown_btns/drop_down_year_button.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class SelectBirthday extends StatefulWidget {
  const SelectBirthday({super.key});

  @override
  State<SelectBirthday> createState() => _SelectBirthdayState();
}

class _SelectBirthdayState extends State<SelectBirthday> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body:
          SafeArea(child: SingleChildScrollView(child: _selectBirthdayBody())),
    );
  }

  Widget _selectBirthdayBody() {
    return SizedBox(
      height: size.height * 0.9,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 1, child: _backButton()),
            Flexible(flex: 3, child: _mainSvg()),
            Flexible(flex: 1, child: _infoText()),
            Flexible(flex: 2, child: _selectDob()),
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
        r'assets/svgs/birthdaypgsvg.svg',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _infoText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Birthday',
          style: textStyle(
              FontWeight.bold, AppColors.commonBtnColor, size.height * 0.024),
        ),
        _verticalSpace(size.height * 0.010),
        Text(
          textAlign: TextAlign.start,
          'Please select your date of birthday',
          style: textStyle(
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.022),
        ),
      ],
    );
  }

  Widget _selectDob() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
            child: MyDropDownDateButton(
          width: size.width * 0.25,
          selection: 'Date',
        )),
        SizedBox(width: size.width * 0.025),
        Flexible(
            child: MyDropDownMonthButton(
          width: size.width * 0.4,
          selection: 'Month',
        )),
        SizedBox(width: size.width * 0.025),
        Flexible(
            child: MyDropDownYearButton(
          width: size.width * 0.3,
          selection: 'Year',
        )),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.policyScreen),
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

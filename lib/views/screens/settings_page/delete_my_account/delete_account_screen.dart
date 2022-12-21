import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors.dart';
import '../../../common/widgets/back_button.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: _deleteMyAccountBody()),
    );
  }

  Widget _deleteMyAccountBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(child: _titleRow()),
            _verticalSpace(size.height * 0.09),
            Flexible(flex: 3, child: _deleteSvg()),
            _verticalSpace(size.height * 0.05),
            Flexible(child: _description()),
            _verticalSpace(size.height * 0.05),
            Flexible(child: _yesButton()),
            _verticalSpace(size.height * 0.02),
            Flexible(child: _noButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Get.back(),
          );
        }),
        SizedBox(
          width: size.width * 0.15,
        ),
        Flexible(
            child: Text(
          'Delete my Account',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _deleteSvg() {
    return SvgPicture.asset(r'assets/svgs/delaccountsvg.svg');
  }

  Widget _description() {
    return Text(
      textAlign: TextAlign.center,
      'Are you sure you want to \n delete your account?',
      style: textStyle(
          FontWeight.w400, const Color(0xff8D99AE), size.height * 0.020),
    );
  }

  Widget _yesButton() {
    return MyButton(
      //onTap: () => Get.toNamed(ScreenNames.addMemberScreen),
      radius: 15,
      color: const Color(0xffC70F0F),
      height: size.height * 0.07,
      width: size.width,
      child: Text(
        'Yes',
        style: textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
      ),
    );
  }

  Widget _noButton() {
    return MyButton(
      //  onTap: () => Get.toNamed(ScreenNames.addMemberScreen),
      radius: 15,
      color: AppColors.commonBtnColor,
      height: size.height * 0.07,
      width: size.width,
      child: Text(
        'No',
        style: textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
      ),
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

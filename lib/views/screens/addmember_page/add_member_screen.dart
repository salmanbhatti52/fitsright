import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: _addMembersBody())),
    );
  }

  Widget _addMembersBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Column(
                children: [
                  Flexible(child: _titleRow()),
                  _verticalSpace(size.height * 0.1),
                  Flexible(
                      child: Text(
                    'Enter Email address of the person you want to add as a member ',
                    style: textStyle(FontWeight.w400, const Color(0xff8D99AE),
                        size.height * 0.020),
                  )),
                  _verticalSpace(size.height * 0.10),
                  const Flexible(
                      child: AppTextFeild(
                    hint: 'tommyjason@gmail',
                  )),
                ],
              ),
            ),
            Flexible(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Flexible(child: _nextButton())],
            )),
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
          width: size.width * 0.20,
        ),
        Flexible(
            child: Text(
          'My Members',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
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
            onTap: () => Get.toNamed(ScreenNames.addMemberScreen),
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

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

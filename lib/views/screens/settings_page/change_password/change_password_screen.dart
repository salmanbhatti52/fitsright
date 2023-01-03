import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/screen_names.dart';
import '../../../../utils/app_colors.dart';
import '../../../common/widgets/app_password_feild.dart';
import '../../../common/widgets/back_button.dart';
import '../../../common/widgets/my_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  bool _obscureText3 = true;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              physics: viewInsets > 0
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: _changePasswordBody())),
    );
  }

  Widget _changePasswordBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          children: [
            Flexible(child: _titleRow()),
            _verticalSpace(size.height * 0.15),
            Flexible(child: _description()),
            _verticalSpace(size.height * 0.08),
            Flexible(
              child: AppPasswordFeild(
                obscure: _obscureText1,
                hint: 'Old Password',
                suffix: IconButton(
                  icon: Icon(
                    _obscureText1 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF6B7280).withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText1 = !_obscureText1;
                    });
                  },
                ),
              ),
            ),
            _verticalSpace(size.height * 0.03),
            Flexible(
              child: AppPasswordFeild(
                obscure: _obscureText2,
                hint: 'New Password',
                suffix: IconButton(
                  icon: Icon(
                    _obscureText2 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF6B7280).withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText2 = !_obscureText2;
                    });
                  },
                ),
              ),
            ),
            _verticalSpace(size.height * 0.03),
            Flexible(
              child: AppPasswordFeild(
                obscure: _obscureText3,
                hint: 'Confirm Password',
                suffix: IconButton(
                  icon: Icon(
                    _obscureText3 ? Icons.visibility : Icons.visibility_off,
                    color: const Color(0xFF6B7280).withOpacity(0.5),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText3 = !_obscureText3;
                    });
                  },
                ),
              ),
            ),
            _verticalSpace(size.height * 0.04),
            Flexible(child: _updateButton()),
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
          width: size.width * 0.17,
        ),
        Flexible(
            child: Text(
          'Change Password',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _description() {
    return Text(
      'Please, enter a new password below different from the previous password.',
      style: textStyle(
          FontWeight.w400, const Color(0xff8D99AE), size.height * 0.020),
    );
  }

  Widget _updateButton() {
    return MyButton(
      onTap: () => Get.toNamed(ScreenNames.settingsScreen),
      radius: 15,
      color: AppColors.commonBtnColor,
      height: size.height * 0.07,
      width: size.width,
      child: Text(
        'Update password',
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

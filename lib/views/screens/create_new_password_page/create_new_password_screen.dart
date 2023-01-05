import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/app_colors.dart';
import '../../../routes/screen_names.dart';
import '../../common/widgets/app_password_feild.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';

class CreateNewPassWord extends StatefulWidget {
  const CreateNewPassWord({super.key});

  @override
  State<CreateNewPassWord> createState() => _CreateNewPassWordState();
}

class _CreateNewPassWordState extends State<CreateNewPassWord> {
  final GlobalKey<FormState> createNewPasswordFormKey = GlobalKey<FormState>();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  bool _obscureText1 = true;
  bool _obscureText2 = true;
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
    return Form(
      key: createNewPasswordFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: AppPasswordFeild(
              obscure: _obscureText1,
              hint: 'New Password',
              controller: newPasswordController,
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
          _verticalSpace(size.height * 0.030),
          Flexible(
            child: AppPasswordFeild(
              obscure: _obscureText2,
              hint: 'Confirm Password',
              controller: confirmPasswordController,
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
        ],
      ),
    );
  }

  Widget _confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.loginScreen),
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

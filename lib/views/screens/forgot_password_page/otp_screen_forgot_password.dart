import 'package:fits_right/views/screens/create_new_password_page/create_new_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../utils/app_colors.dart';
import '../../../services/dio-service.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';
import '../../common/widgets/toast_message.dart';

class OtpScreenForgotPassword extends StatefulWidget {
  const OtpScreenForgotPassword({super.key});

  @override
  State<OtpScreenForgotPassword> createState() =>
      _OtpScreenForgotPasswordState();
}

class _OtpScreenForgotPasswordState extends State<OtpScreenForgotPassword> {
  final GlobalKey<FormState> otpForgotPasswordFormKey = GlobalKey<FormState>();
  String currentText = "";
  var otpController = TextEditingController();
  bool progress = false;

  _otpForgotPassword() async {
    var response = await DioService.post('signup_verify_otp', {
      'otp': otpController.text,
      'users_customers_id': '41',
    });
    if (response['status'] == 'success') {
      setState(
        () {
          progress = false;
        },
      );
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreateNewPassWord()));
    }
    if (response['status'] != 'success') {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          toastFailedMessage("OTP is invalid", Colors.red);
          setState(
            () {
              progress = false;
            },
          );
        },
      );
    }
  }

  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: progress,
        opacity: 0.02,
        blur: 0.5,
        color: Colors.transparent,
        progressIndicator: const CircularProgressIndicator(
          color: AppColors.commonBtnColor,
        ),
        child: SafeArea(
            child: SingleChildScrollView(
                physics: viewInsets > 0
                    ? const BouncingScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: _otpScreenForgotPasswordBody())),
      ),
    );
  }

  Widget _otpScreenForgotPasswordBody() {
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
        const Text(
          textAlign: TextAlign.left,
          'We send a code to ( *****@mail.com ). \nEnter it here to verify your identity ',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Color(0xFF8D99AE),
              fontSize: 16,
              height: 1.5),
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
              'Send again',
              style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                  size.height * 0.016),
            ),
          ],
        ),
      ],
    );
  }

  Widget _otpTextFeild() {
    return Form(
      key: otpForgotPasswordFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 45),
        child: PinCodeTextField(
          appContext: context,
          length: 4,
          validator: (v) {
            if (v!.length < 3) {
              return "I'm from validator";
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(18),
              fieldHeight: 55,
              fieldWidth: 55,
              borderWidth: 0.9,
              activeColor: AppColors.commonBtnColor,
              selectedColor: AppColors.commonBtnColor,
              inactiveColor: const Color(0xffBDC6D1),
              disabledColor: const Color(0xffBDC6D1)),
          cursorColor: AppColors.commonBtnColor,
          // cursorHeight: 20,
          controller: otpController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {
            debugPrint("Completed");
          },
          onChanged: (value) {
            debugPrint(value);
            setState(() {
              currentText = value;
            });
          },
          beforeTextPaste: (text) {
            debugPrint("Allowing to paste $text");
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }

  Widget confirmButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () {
              // Get.toNamed(ScreenNames.createNewPasswordScreen);
              if (otpForgotPasswordFormKey.currentState!.validate()) {
                if (otpController.text.isEmpty) {
                  toastFailedMessage('All fields are required', Colors.red);
                } else {
                  setState(() {
                    progress = true;
                  });
                  _otpForgotPassword();
                }
              }
            },
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Confirm',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }
}

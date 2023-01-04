import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/services/dio-service.dart';
import 'package:fits_right/views/screens/create_new_account_page/otp_screen_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../utils/app_colors.dart';
import '../../common/widgets/app_password_feild.dart';
import '../../common/widgets/app_text_feild.dart';
import '../../common/widgets/back_button.dart';
import '../../common/widgets/my_button.dart';
import '../../common/widgets/toast_message.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  bool _obscureText = true;
  bool progress = false;
  late Size size;

  final GlobalKey<FormState> singUpFormKey = GlobalKey<FormState>();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  // CreateNewAccountModel createNewAccountModel = CreateNewAccountModel();
  _usersignup() async {
    var response = await DioService.post('signup', {
      'onesignal_id': '1',
      'full_name': fullNameController.text.trim(),
      'user_email': emailController.text.trim(),
      'user_password': passwordController.text,
      'user_phone': phoneController.text.trim(),
      'system_genders_id': '1',
      'date_of_birth': '2022-11-22',
      'terms_agreements': 'Yes',
      'notification_switch': 'Yes'
    });
    if (response['status'] == 'success') {
      // Future.delayed(
      //   const Duration(seconds: 3),
      //   () {
      toastSuccessMessage("OTP sent to your email", AppColors.commonBtnColor);
      setState(
        () {
          progress = false;
        },
      );
      //   },
      // );
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const OtpScreenSignup()));
    }
    if (response['status'] != 'success') {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          toastFailedMessage("Signup Error", Colors.red);
          setState(
            () {
              progress = false;
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    var viewInsets = MediaQuery.of(context).viewInsets.bottom;
    return ModalProgressHUD(
      inAsyncCall: progress,
      opacity: 0.02,
      blur: 0.5,
      color: Colors.transparent,
      progressIndicator: const CircularProgressIndicator(
        color: AppColors.commonBtnColor,
      ),
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          physics: viewInsets > 0
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: _createNewAccountBody(),
        )),
      ),
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
            Flexible(flex: 5, child: _textFeilds()),
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
              FontWeight.normal, const Color(0xFF8D99AE), size.height * 0.020),
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
              border: Border.all(color: const Color(0xFFBDC6D1)),
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
    return Form(
      key: singUpFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppTextFeild(
              hint: 'Full Name',
              controller: fullNameController,
              keyboardType: TextInputType.name,
            ),
          ),
          _verticalSpace(size.height * 0.015),
          Flexible(
            child: AppTextFeild(
              hint: 'Email',
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          _verticalSpace(size.height * 0.015),
          Flexible(
            child: AppTextFeild(
              hint: 'Phone Number',
              controller: phoneController,
              keyboardType: TextInputType.phone,
            ),
          ),
          _verticalSpace(size.height * 0.015),
          Flexible(
            child: AppPasswordFeild(
              obscure: _obscureText,
              hint: 'Password',
              controller: passwordController,
              suffix: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF6B7280).withOpacity(0.5),
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Row(
      children: [
        Flexible(
          child: MyButton(
              onTap: () async {
                // Get.toNamed(ScreenNames.otpScreenSignup);
                if (singUpFormKey.currentState!.validate()) {
                  if (fullNameController.text.isEmpty) {
                    toastFailedMessage('Fullname is required', Colors.red);
                  } else if (emailController.text.isEmpty) {
                    toastFailedMessage('Email is required', Colors.red);
                  } else if (phoneController.text.isEmpty) {
                    toastFailedMessage('Phone Number is requirded', Colors.red);
                  } else if (passwordController.text.length < 6) {
                    toastFailedMessage(
                        'Password must be atleast 6 digit', Colors.red);
                  } else {
                    setState(() {
                      progress = true;
                    });
                    _usersignup();
                  }
                }
              },
              radius: 15,
              color: AppColors.commonBtnColor,
              height: size.height * 0.07,
              width: size.width,
              child: Text(
                'Next',
                style: textStyle(
                    FontWeight.w700, Colors.white, size.height * 0.020),
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
          'Already have an account?',
          style: textStyle(
              FontWeight.normal, const Color(0xFF6B7280), size.height * 0.016),
        ),
        const SizedBox(
          width: 1,
        ),
        GestureDetector(
          onTap: () => Get.toNamed(ScreenNames.loginScreen),
          child: Text(
            'Sign In',
            style: textStyle(
                FontWeight.bold, AppColors.commonBtnColor, size.height * 0.016),
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

  textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

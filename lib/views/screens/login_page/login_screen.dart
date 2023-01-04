import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/app_text_feild.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:fits_right/views/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../services/dio-service.dart';
import '../../common/widgets/app_password_feild.dart';
import '../../common/widgets/toast_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Size size;
  bool _obscureText = true;
  bool progress = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  bool checkBoxValue = false;

  _userLogin() async {
    var response = await DioService.post('login', {
      'user_email': emailController.text,
      'user_password': passwordController.text,
      'onesignal_id': 'onesignal_id'
    });
    if (response['status'] == 'success') {
      // Future.delayed(
      //   const Duration(seconds: 3),
      //   () {
      toastSuccessMessage("Login Successful", AppColors.commonBtnColor);
      setState(
        () {
          progress = false;
        },
      );
      //   },
      // );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    if (response['status'] != 'success') {
      Future.delayed(
        const Duration(seconds: 3),
        () {
          toastFailedMessage("Login Error", Colors.red);
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
    return SafeArea(
      child: Scaffold(
        body: ModalProgressHUD(
          inAsyncCall: progress,
          opacity: 0.02,
          blur: 0.5,
          color: Colors.transparent,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.commonBtnColor,
          ),
          child: SingleChildScrollView(
              physics: viewInsets > 0
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: _loginScreenBody()),
        ),
      ),
    );
  }

  Widget _loginScreenBody() {
    return SizedBox(
      height: size.height * 0.95,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: backButton()),
            Expanded(flex: 3, child: appLogo()),
            Flexible(flex: 2, child: greetingText()),
            Flexible(flex: 5, child: textFeilds()),
            _verticalSpace(size.height * 0.035),
            Flexible(flex: 2, child: loginButton()),
            _verticalSpace(size.height * 0.030),
            Flexible(child: orText()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 2, child: signInWith()),
            _verticalSpace(size.height * 0.030),
            Flexible(flex: 1, child: dontHaveAccText()),
          ],
        ),
      ),
    );
  }

  Widget backButton() {
    return Row(
      children: [
        AppBackBtn(
          onTap: () => SystemNavigator.pop(),
        ),
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

  Widget greetingText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi There! 👋',
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

  Widget textFeilds() {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: AppTextFeild(
              hint: 'Email or Phone Number',
              controller: emailController,
            ),
          ),
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
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Get.toNamed(ScreenNames.forogotScreen),
                child: Text(
                  'Forgot Password?',
                  style: textStyle(FontWeight.w600, const Color(0xFF000000),
                      size.height * 0.016),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
              onTap: () {
                // Get.toNamed(ScreenNames.selectGenderScreen);
                if (loginFormKey.currentState!.validate()) {
                  if (emailController.text.isEmpty) {
                    toastFailedMessage('Email is required', Colors.red);
                  } else if (passwordController.text.isEmpty) {
                    toastFailedMessage('Password is required', Colors.red);
                  } else {
                    setState(() {
                      progress = true;
                    });
                    _userLogin();
                  }
                }
              },
              radius: 15,
              color: AppColors.commonBtnColor,
              height: size.height * 0.07,
              width: size.width,
              child: Text(
                'Sign In',
                style: textStyle(
                    FontWeight.w700, Colors.white, size.height * 0.020),
              )),
        ),
      ],
    );
  }

  Widget signInWith() {
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

  Widget dontHaveAccText() {
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
        GestureDetector(
          onTap: () => Get.toNamed(ScreenNames.creatAccountScreen),
          child: Text(
            'Sign Up',
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

  Widget orText() {
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
}

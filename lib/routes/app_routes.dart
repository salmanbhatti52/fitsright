import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/common/screens/create_new_account_page/create_new_account_screen.dart';
import 'package:fits_right/views/common/screens/create_new_password_page/create_new_password_screen.dart';
import 'package:fits_right/views/common/screens/forgot_password_page/forgot_password_screen.dart';
import 'package:fits_right/views/common/screens/login_page/login_screen.dart';
import 'package:fits_right/views/common/screens/otp_page/otp_screen.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../views/common/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(
      name: ScreenNames.otpScreen,
      page: () => const OtpScreen(),
    ),
    GetPage(
      name: ScreenNames.loginScreen,
      page: () => const LoginScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: ScreenNames.creatAccountScreen,
      page: () => const CreateNewAccount(),
    ),
    GetPage(
      name: ScreenNames.forogotScreen,
      page: () => const ForgotPassword(),
    ),
    GetPage(
        name: ScreenNames.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.elasticInOut),
    GetPage(
      name: ScreenNames.createNewPasswordScreen,
      page: () => const CreateNewPassWord(),
    )
  ];
}

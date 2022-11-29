import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/screens/home_page/home_page.dart';
import 'package:fits_right/views/screens/measurement_detail_page/measurement_detail_screen.dart';
import 'package:fits_right/views/screens/measurement_page/measurement_screen.dart';
import 'package:fits_right/views/screens/policy_page/policy_screen.dart';
import 'package:fits_right/views/screens/take_measurement_page/take_measurement_screen.dart';
import 'package:get/get.dart';

import '../views/screens/create_new_account_page/create_new_account_screen.dart';
import '../views/screens/create_new_password_page/create_new_password_screen.dart';
import '../views/screens/forgot_password_page/forgot_password_screen.dart';
import '../views/screens/login_page/login_screen.dart';
import '../views/screens/otp_page/otp_screen.dart';
import '../views/screens/select_birthday_page/select_birthday_screen.dart';
import '../views/screens/select_gender_page/select_gender_screen.dart';
import '../views/screens/splash_screen/splash_screen.dart';

class AppRoutes {
  static final appRoutes = [
    GetPage(
      name: ScreenNames.homeScreen,
      page: () => const HomePage(),
    ),
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
    ),
    GetPage(
      name: ScreenNames.createNewPasswordScreen,
      page: () => const CreateNewPassWord(),
    ),
    GetPage(
      name: ScreenNames.selectGenderScreen,
      page: () => const SelectGender(),
    ),
    GetPage(
      name: ScreenNames.selectBirthdayScreen,
      page: () => const SelectBirthday(),
    ),
    GetPage(
      name: ScreenNames.policyScreen,
      page: () => const PolicyScreen(),
    ),
    GetPage(
      name: ScreenNames.measurementScreen,
      page: () => const Measurements(),
    ),
    GetPage(
      name: ScreenNames.takeMeasurementScreen,
      page: () => const TakeMeasurement(),
    ),
    GetPage(
      name: ScreenNames.measurementDetailScreen,
      page: () => const MeasurementDetail(),
    ),
  ];
}

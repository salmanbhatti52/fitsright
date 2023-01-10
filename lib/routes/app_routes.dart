import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/screens/addmember_page/add_member_screen.dart';
import 'package:fits_right/views/screens/create_new_account_page/otp_screen_signup.dart';
import 'package:fits_right/views/screens/forgot_password_page/otp_screen_forgot_password.dart';
import 'package:fits_right/views/screens/settings_page/change_password/change_password_screen.dart';
import 'package:fits_right/views/screens/settings_page/delete_my_account/delete_account_screen.dart';
import 'package:fits_right/views/screens/feedback_page/feedback_screen.dart';
import 'package:fits_right/views/screens/home_page/home_page.dart';
import 'package:fits_right/views/screens/measurement_detail_page/measurement_detail_screen.dart';
import 'package:fits_right/views/screens/measurement_page/measurement_screen.dart';
import 'package:fits_right/views/screens/members_page/members_screen.dart';
import 'package:fits_right/views/screens/policy_page/policy_screen.dart';
import 'package:fits_right/views/screens/profile_page/profile_screen.dart';
import 'package:fits_right/views/screens/settings_page/about/about_screen.dart';
import 'package:fits_right/views/screens/settings_page/privacy_policy/privacy_policy.dart';
import 'package:fits_right/views/screens/settings_page/settings_screen.dart';
import 'package:fits_right/views/screens/settings_page/term_and_conditions/term_and_condtions.dart';
import 'package:fits_right/views/screens/shopping_page/shopping_screen.dart';
import 'package:fits_right/views/screens/take_measurement_page/male/take_measurment_screen_male.dart';
import 'package:get/get.dart';
import '../views/screens/create_new_account_page/create_new_account_screen.dart';
import '../views/screens/create_new_password_page/create_new_password_screen.dart';
import '../views/screens/forgot_password_page/forgot_password_screen.dart';
import '../views/screens/login_page/login_screen.dart';
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
      name: ScreenNames.otpScreenSignup,
      page: () => const OtpScreenSignup(),
    ),
    GetPage(
      name: ScreenNames.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: ScreenNames.creatAccountScreen,
      page: () => const CreateNewAccount(),
    ),
    GetPage(
      name: ScreenNames.otpScreenForgotPassword,
      page: () => const OtpScreenForgotPassword(),
    ),
    GetPage(
      name: ScreenNames.forogotScreen,
      page: () => const ForgotPassword(),
    ),
    GetPage(
      name: ScreenNames.splashScreen,
      page: () => const SplashScreen(),
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
      name: ScreenNames.takeMeasurementScreenMale,
      page: () => const TakeMeasurementMale(),
    ),
    GetPage(
      name: ScreenNames.measurementDetailScreen,
      page: () => const MeasurementDetail(),
    ),
    GetPage(
      name: ScreenNames.profileScreen,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: ScreenNames.shoppingScreen,
      page: () => const ShoppignScreen(),
    ),
    GetPage(
      name: ScreenNames.memberScreen,
      page: () => const MembersScreen(),
    ),
    GetPage(
      name: ScreenNames.addMemberScreen,
      page: () => const AddMember(),
    ),
    GetPage(
      name: ScreenNames.feedBackScreen,
      page: () => const FeedBackScreen(),
    ),
    GetPage(
      name: ScreenNames.settingsScreen,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: ScreenNames.aboutScreen,
      page: () => const AboutScreen(),
    ),
    GetPage(
      name: ScreenNames.privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
    ),
    GetPage(
      name: ScreenNames.termAndCondtionsScreen,
      page: () => const TermAndConditionsScreen(),
    ),
    GetPage(
      name: ScreenNames.deleteAccountScreen,
      page: () => const DeleteAccountScreen(),
    ),
    GetPage(
      name: ScreenNames.changePasswordScreen,
      page: () => const ChangePasswordScreen(),
    ),
  ];
}

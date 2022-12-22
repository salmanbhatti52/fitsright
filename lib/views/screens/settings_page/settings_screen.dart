import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/settings_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/app_menu_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(child: _settingsBody()),
    );
  }

  Widget _settingsBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: _titleRow()),
            SizedBox(
              height: size.height * 0.050,
            ),
            Expanded(flex: 5, child: _settings()),
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
          return AppMenuButton(
            onTap: () => Scaffold.of(context).openDrawer(),
          );
        }),
        SizedBox(
          width: size.width * 0.25,
        ),
        Flexible(
            child: Text(
          'Settings',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _settings() {
    return Column(
      children: [
        SettingsListItem(
            onTap: () => Get.toNamed(ScreenNames.termAndCondtionsScreen),
            trailing: AppBackBtn(
                icon: SvgPicture.asset('assets/svgs/arrow_forward.svg')),
            title: 'Terms & Conditions '),
        _verticalSpace(),
        SettingsListItem(
            onTap: () => Get.toNamed(ScreenNames.privacyPolicyScreen),
            trailing: AppBackBtn(
                icon: SvgPicture.asset('assets/svgs/arrow_forward.svg')),
            title: 'Privacy Policy '),
        _verticalSpace(),
        SettingsListItem(
            onTap: () => Get.toNamed(ScreenNames.aboutScreen),
            trailing: AppBackBtn(
                icon: SvgPicture.asset('assets/svgs/arrow_forward.svg')),
            title: 'About us'),
        _verticalSpace(),
        SettingsListItem(
            onTap: () => Get.toNamed(ScreenNames.changePasswordScreen),
            trailing: AppBackBtn(
                icon: SvgPicture.asset('assets/svgs/arrow_forward.svg')),
            title: 'Change Password '),
        _verticalSpace(),
        SettingsListItem(
            onTap: () => Get.toNamed(ScreenNames.deleteAccountScreen),
            trailing: AppBackBtn(
                icon: SvgPicture.asset('assets/svgs/arrow_forward.svg')),
            title: 'Delete my Account '),
      ],
    );
  }

  Widget _verticalSpace() {
    return SizedBox(
      height: size.height * 0.015,
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

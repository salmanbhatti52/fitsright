import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width * 0.7,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(size.height * 0.025),
            bottomRight: Radius.circular(size.height * 0.025),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: _btnClose()),
                  Flexible(child: _profilePic()),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(child: _drawerList()),
              ],
            ),
          ),
          Expanded(
            child: DrawerListItem(
              onTap: () => Get.toNamed(ScreenNames.loginScreen),
              tileIcon: Image.asset(r'assets/pngs/signouticon.png'),
              tileText: 'Sign Out',
            ),
          ),
        ],
      ),
    );
  }

  Widget _btnClose() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Builder(
            builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).closeDrawer(),
                child: const Icon(Icons.close)),
          ),
        ),
      ],
    );
  }

  Widget _profilePic() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            children: [
              Flexible(
                flex: 4,
                child: Container(
                  height: 200,
                  width: 200,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.withOpacity(0.1))),
                  child: Image.asset(r'assets/pngs/home_page_bg.jpg',
                      fit: BoxFit.scaleDown),
                ),
              ),
              _verticalSpace(size.height * 0.009),
              Flexible(
                  child: Text(
                'Wade Warren',
                style: nameTextStyle(size),
              )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _drawerList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DrawerListItem(
          onTap: () => Get.toNamed(ScreenNames.measurementScreen),
          tileIcon: Image.asset(r'assets/pngs/retailersicon.png'),
          tileText: 'Measurement',
          bgColor: AppColors.commonBtnColor,
        ),
        _verticalSpace(size.height * 0.016),
        DrawerListItem(
          onTap: () => Get.toNamed(ScreenNames.profileScreen),
          tileIcon: Image.asset(r'assets/pngs/profileIcon.png'),
          tileText: 'Profile',
        ),
        _verticalSpace(size.height * 0.016),
        DrawerListItem(
          onTap: () => Get.toNamed(ScreenNames.memberScreen),
          tileIcon: Image.asset(r'assets/pngs/membersicon.png'),
          tileText: 'My Members',
        ),
        _verticalSpace(size.height * 0.016),
        DrawerListItem(
          tileIcon: Image.asset(r'assets/pngs/retailersicon.png'),
          tileText: 'Browse by Retailers',
        ),
        _verticalSpace(size.height * 0.016),
        DrawerListItem(
          onTap: () => Get.toNamed(ScreenNames.feedBackScreen),
          tileIcon: Image.asset(r'assets/pngs/feedbackicon.png'),
          tileText: 'Feedback',
        ),
        _verticalSpace(size.height * 0.016),
        DrawerListItem(
          onTap: () => Get.toNamed(ScreenNames.settingsScreen),
          tileIcon: Image.asset(r'assets/pngs/settingsicon.png'),
          tileText: 'Settings',
        ),
      ],
    );
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  TextStyle nameTextStyle(Size size) {
    return GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: const Color(0xFF000000),
        fontSize: size.height * 0.020);
  }
}

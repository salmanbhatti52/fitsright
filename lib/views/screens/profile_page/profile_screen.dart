import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:fits_right/views/common/widgets/app_menu_button.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/profile_pic_screen_row_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(child: _profileScreen()),
    );
  }

  Widget _profileScreen() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: _titleBar()),
            Flexible(flex: 1, child: _tabs()),
            Expanded(flex: 9, child: _tabBarViews()),
          ],
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Builder(builder: (context) {
            return AppMenuButton(
              onTap: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        Flexible(
            flex: 3,
            child: Text(
              'Profile',
              style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                  size.height * 0.025),
            )),
        Flexible(
          flex: 1,
          child: AppBackBtn(
              icon: SvgPicture.asset('assets/svgs/profileediticon.svg')),
        ),
      ],
    );
  }

  Widget _tabs() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 11,
            child: Container(
                height: 40,
                // width: size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.grey
                    // color: const Color(0xFFEDF2F4),
                    ),
                child: TabBar(
                  indicator: RectangularIndicator(
                      color: AppColors.commonBtnColor,
                      bottomLeftRadius: 20,
                      bottomRightRadius: 20,
                      topRightRadius: 20,
                      topLeftRadius: 20,
                      horizontalPadding: 3,
                      verticalPadding: 3),
                  controller: _tabController,
                  tabs: [
                    Text(
                      'Profile',
                      style: textStyle(
                          FontWeight.w600, Colors.white, size.height * 0.018),
                    ),
                    Text(
                      'Subscription',
                      style: textStyle(
                          FontWeight.w600, Colors.white, size.height * 0.018),
                    ),
                  ],
                ))),
      ],
    );
  }

  Widget _tabBarViews() {
    return TabBarView(controller: _tabController, children: [
      _profileTab(),
      _subscriptionTab(),
    ]);
  }

  Widget _profileTab() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 3,
          child: _profilePicture(),
        ),
        Flexible(flex: 1, child: _userNameAndEmail()),
        Flexible(flex: 2, child: genderAndDobContainer()),
        Flexible(flex: 2, child: measurementValuesContainer()),
      ],
    );
  }

  Widget _profilePicture() {
    return Container(
      height: size.height * 0.55,
      width: size.width * 0.60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppColors.commonBtnColor)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: size.height * 0.42,
          width: size.width * 0.47,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: Colors.transparent),
          child: Image.asset(
            'assets/pngs/home_page_bg.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _userNameAndEmail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Wade Warren',
                  style: textStyle(FontWeight.w600, const Color(0xff000000),
                      size.height * 0.020),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: size.width * 0.16,
                        ),
                      ),
                      SvgPicture.asset('assets/svgs/profileemailicon.svg'),
                      Flexible(
                        child: SizedBox(
                          width: size.width * 0.03,
                        ),
                      ),
                      Text(
                        'wadewarren@example.com',
                        style: textStyle(FontWeight.w500,
                            const Color(0xFF818D92), size.height * 0.012),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget genderAndDobContainer() {
    return Container(
      width: size.width,
      height: size.height * 0.14,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFEDF2F4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Gender',
                  style: textStyle(FontWeight.w600, const Color(0xff000000),
                      size.height * 0.018),
                ),
                Text(
                  'Male',
                  style: textStyle(FontWeight.w400, const Color(0xff818D92),
                      size.height * 0.016),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date of Birth',
                  style: textStyle(FontWeight.w600, const Color(0xff000000),
                      size.height * 0.018),
                ),
                Text(
                  '21 July, 1992',
                  style: textStyle(FontWeight.w400, const Color(0xff818D92),
                      size.height * 0.016),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget measurementValuesContainer() {
    return Container(
      width: size.width,
      height: size.height * 0.17,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFEDF2F4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ProfilePicRowItem(title: 'Waist', subTitle: '29 cm'),
                ProfilePicRowItem(title: 'Hip', subTitle: '29 cm'),
                ProfilePicRowItem(title: 'Bust', subTitle: '29 cm'),
                ProfilePicRowItem(title: 'Low Hip', subTitle: '29 cm'),
                ProfilePicRowItem(title: 'High Hip', subTitle: '29 cm'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ProfilePicRowItem(title: 'Collar', subTitle: '165 cm'),
                ProfilePicRowItem(
                    title: 'Inside Leg Length', subTitle: '165 cm'),
                ProfilePicRowItem(title: 'Sleeve Length', subTitle: '165 cm'),
                ProfilePicRowItem(title: 'Height', subTitle: '165 cm'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _subscriptionTab() {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.20,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFEDF2F4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '£1.99',
                  style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                      size.height * 0.040),
                ),
                Text(
                  'Per Month',
                  style: textStyle(FontWeight.w400, const Color(0xFF818D92),
                      size.height * 0.020),
                ),
                _subscribeButton(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.12,
        ),
        Column(
          children: [
            Text(
              'Start a 7 days free Trial',
              style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                  size.height * 0.024),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              'Your Card will be automatically charged if you don’t \n cancel it within 7 days',
              textAlign: TextAlign.center,
              style: textStyle(FontWeight.w400, const Color(0xff8D99AE),
                  size.height * 0.016),
            ),
          ],
        ),
      ],
    );
  }

  Widget _subscribeButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Subscribe',
              style:
                  textStyle(FontWeight.w700, Colors.white, size.height * 0.020),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

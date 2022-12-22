import 'package:fits_right/views/common/widgets/profile_pic_screen_row_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/app_menu_button.dart';
import '../../common/widgets/my_button.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({super.key});

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: _membersScreenBody()),
    );
  }

  Widget _membersScreenBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(child: _titleRow()),
            SizedBox(
              height: size.height * 0.010,
            ),
            Expanded(flex: 5, child: myMembers()),
            Expanded(flex: 0, child: _nextButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Builder(builder: (context) {
            return AppMenuButton(
              onTap: () => Scaffold.of(context).openDrawer(),
            );
          }),
        ),
        SizedBox(
          width: size.width * 0.20,
        ),
        Flexible(
            child: Text(
          'My Members',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget myMembers() {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ListView.builder(itemCount: 2, itemBuilder: _itemBuilder),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width,
        height: size.height * 0.20,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFEDF2F4)),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Flexible(child: cardFirstRow()),
              Flexible(child: cardSecondRow()),
              Flexible(child: cardThirdRow()),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardFirstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Johnson Stephen',
                  style: textStyle(
                      FontWeight.w600, Colors.black, size.height * 0.016),
                ),
                Text(
                  'Male',
                  style: textStyle(FontWeight.w500, const Color(0xff818D92),
                      size.height * 0.014),
                ),
              ],
            )
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/svgs/appdeleteicon.svg',
            ),
            const SizedBox(width: 4),
            SvgPicture.asset(
              'assets/svgs/appediticon.svg',
            ),
          ],
        ),
      ],
    );
  }

  Widget cardSecondRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        ProfilePicRowItem(title: 'Wasit', subTitle: '29 cm'),
        ProfilePicRowItem(title: 'Hip', subTitle: '29 cm'),
        ProfilePicRowItem(title: 'Bust', subTitle: '29 cm'),
        ProfilePicRowItem(title: 'Low Hip', subTitle: '29 cm'),
        ProfilePicRowItem(title: 'High Hip', subTitle: '29 cm'),
      ],
    );
  }

  Widget cardThirdRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        ProfilePicRowItem(title: 'Collar', subTitle: '165 cm'),
        ProfilePicRowItem(title: 'Inside Leg Length', subTitle: '165 cm'),
        ProfilePicRowItem(title: 'Sleeve Length', subTitle: '165 cm'),
        ProfilePicRowItem(title: 'Height', subTitle: '165 cm'),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.addMemberScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Add New',
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

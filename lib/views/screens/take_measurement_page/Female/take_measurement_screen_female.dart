import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar.dart';
import 'package:fits_right/views/common/widgets/measurement_unit_selector.dart';
import 'package:fits_right/views/common/widgets/my_button.dart';
import 'package:fits_right/views/common/tabbar_view/female/bust.dart';
import 'package:fits_right/views/common/tabbar_view/female/calf.dart';
import 'package:fits_right/views/common/tabbar_view/female/height.dart';
import 'package:fits_right/views/common/tabbar_view/female/highhip.dart';
import 'package:fits_right/views/common/tabbar_view/female/insideleglength.dart';
import 'package:fits_right/views/common/tabbar_view/female/lowhip.dart';
import 'package:fits_right/views/common/tabbar_view/female/sleeve_length.dart';
import 'package:fits_right/views/common/tabbar_view/female/thigh.dart';
import 'package:fits_right/views/common/tabbar_view/female/waist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/tabbar_view/female/neck.dart';

class TakeMeasurementFemale extends StatefulWidget {
  const TakeMeasurementFemale({super.key});

  @override
  State<TakeMeasurementFemale> createState() => _TakeMeasurementFemale();
}

class _TakeMeasurementFemale extends State<TakeMeasurementFemale>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _takeMeasurementBody(),
        ),
      ),
    );
  }

  Widget _takeMeasurementBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 2, child: _titleBar()),
            Flexible(flex: 1, child: _tabBar()),
            Flexible(flex: 9, child: _tabBarView()),
            Flexible(flex: 1, child: _measurementEntry()),
            const Flexible(flex: 1, child: MeasurementUnitWidget()),
            Flexible(flex: 1, child: _nextButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Get.back(),
          );
        }),
        SizedBox(
          width: size.width * 0.195,
        ),
        Flexible(
            child: Text(
          'Measurement',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _tabBar() {
    return SizedBox(
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.grey,
        ),
        width: size.width,
        height: size.height * 0.043,
        child: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicatorPadding:
                const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            controller: _tabController,
            isScrollable: true,
            enableFeedback: true,
            indicator: BoxDecoration(
              color: AppColors.commonBtnColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            tabs: const [
              MeasureTabBar(tabName: 'Neck'),
              MeasureTabBar(tabName: 'Sleeve length'),
              MeasureTabBar(tabName: 'Chest/bust'),
              MeasureTabBar(tabName: 'Waist'),
              MeasureTabBar(tabName: 'Low Hip'),
              MeasureTabBar(tabName: 'High Hip'),
              MeasureTabBar(tabName: 'Height'),
              MeasureTabBar(tabName: 'Calf'),
              MeasureTabBar(tabName: 'Thigh'),
              MeasureTabBar(tabName: 'Inside leg length'),
            ]),
      ),
    );
  }

  Widget _tabBarView() {
    return TabBarView(controller: _tabController, children: const [
      NeckTabBarView(),
      SleeveLengthTabBarView(),
      BustTabBarView(),
      WaistTabBarView(),
      LowHipTabBarView(),
      HighHipTabBarView(),
      HeightTabBarView(),
      CalfTabBarView(),
      ThighTabBarView(),
      InsideLegLengthTabBarView(),
    ]);
  }

  Widget _measurementEntry() {
    return TextFormField(
      cursorColor: AppColors.commonBtnColor,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: size.width, minWidth: size.width),
        hintText: 'Enter Size',
        hintStyle: textStyle(
            FontWeight.w400, const Color(0xFF9CA3AF), size.height * 0.016),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            width: 0.9,
            style: BorderStyle.solid,
            color: Color(0xffBDC6D1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            width: 0.9,
            style: BorderStyle.solid,
            color: AppColors.commonBtnColor,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            width: 0.9,
            style: BorderStyle.solid,
            color: Color(0xffBDC6D1),
          ),
        ),
      ),
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.measurementDetailScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Next',
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

import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../routes/screen_names.dart';
import '../../../../../utils/app_colors.dart';
import '../../../common/widgets/measurement_unit_selector.dart';
import '../../../common/widgets/my_button.dart';

class TakeMeasurement extends StatefulWidget {
  const TakeMeasurement({super.key});

  @override
  State<TakeMeasurement> createState() => _TakeMeasurementState();
}

class _TakeMeasurementState extends State<TakeMeasurement>
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
        child: _takeMeasurementBody(),
      ),
    );
  }

  Widget _takeMeasurementBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: SingleChildScrollView(
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
      MeasureTabBarView(
        bodyPart: 'Neck',
        bodyPartModel: ('assets/pngs/neck_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Sleeve Length',
        bodyPartModel: ('assets/pngs/sleevelength_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Chest',
        bodyPartModel: ('assets/pngs/chest_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Waists',
        bodyPartModel: ('assets/pngs/waist_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Low Hip',
        bodyPartModel: ('assets/pngs/lowhip_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'High Hip',
        bodyPartModel: ('assets/pngs/highhip_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Height',
        bodyPartModel: ('assets/pngs/height_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Calf',
        bodyPartModel: ('assets/pngs/calf_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Thigh',
        bodyPartModel: ('assets/pngs/thigh_male.png'),
      ),
      MeasureTabBarView(
        bodyPart: 'Inside Leg Length',
        bodyPartModel: ('assets/pngs/insideleglength_male.png'),
      )
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
  // Widget _measurementSlider() {
  //   return Container(
  //     width: size.width,
  //     height: size.height,
  //     color: Colors.transparent,
  //     child: SfSlider(
  //       inactiveColor: Colors.transparent,
  //       activeColor: Colors.transparent,
  //       thumbIcon: const VerticalDivider(
  //         thickness: 1,
  //         color: Colors.black,
  //       ),
  //       min: 1,
  //       max: 20,
  //       interval: 1,
  //       // stepSize: 2,
  //       enableTooltip: true,
  //       minorTicksPerInterval: 3,
  //       showTicks: true,
  //       value: _value,
  //       onChanged: (value) {
  //         setState(() {
  //           _value = value;
  //         });
  //       },
  //     ),
  //   );
  // }

  // Widget _measurementUnit() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       Container(
  //         width: size.width * 0.16,
  //         height: size.height * 0.04,
  //         decoration: BoxDecoration(
  //             color: AppColors.commonBtnColor,
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Center(
  //             child: Text(
  //               'inches',
  //               style: textStyle(
  //                   FontWeight.w400, Colors.white, size.height * 0.014),
  //             ),
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         width: size.width * 0.02,
  //       ),
  //       Container(
  //         width: size.width * 0.16,
  //         height: size.height * 0.04,
  //         decoration: BoxDecoration(
  //             //  color: Colors.blue,
  //             border: Border.all(width: 1, color: const Color(0xFFBDC6D1)),
  //             borderRadius: BorderRadius.circular(20)),
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Center(
  //             child: Text(
  //               'cm',
  //               style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
  //                   size.height * 0.014),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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

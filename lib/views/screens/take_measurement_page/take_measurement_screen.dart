import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar.dart';
import 'package:fits_right/views/common/widgets/measure_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class TakeMeasurement extends StatefulWidget {
  const TakeMeasurement({super.key});

  @override
  State<TakeMeasurement> createState() => _TakeMeasurementState();
}

class _TakeMeasurementState extends State<TakeMeasurement>
    with SingleTickerProviderStateMixin {
  late Size size;
  late TabController _tabController;
  double _value = 0.0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 10, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    //print('build is Called');
    size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: _takeMeasurementBody()),
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
            Flexible(flex: 1, child: _measurementSlider()),
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
              MeasureTabBar(tabName: 'High hip'),
              MeasureTabBar(tabName: 'Low hip'),
              MeasureTabBar(tabName: 'Belly'),
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
          bodyPart: 'Neck', bodyPartModel: ('assets/pngs/neck.png')),
      MeasureTabBarView(
          bodyPart: 'Sleeve length',
          bodyPartModel: ('assets/pngs/sleevelength.png')),
      MeasureTabBarView(
          bodyPart: 'Chest/bust', bodyPartModel: ('assets/pngs/bust.png')),
      MeasureTabBarView(
          bodyPart: 'Waists', bodyPartModel: ('assets/pngs/waist.png')),
      MeasureTabBarView(
          bodyPart: 'High hip', bodyPartModel: ('assets/pngs/highhip.png')),
      MeasureTabBarView(
          bodyPart: 'Low hip', bodyPartModel: ('assets/pngs/lowhip.png')),
      MeasureTabBarView(
          bodyPart: 'Belly', bodyPartModel: ('assets/pngs/belly.png')),
      MeasureTabBarView(
          bodyPart: 'Calf', bodyPartModel: ('assets/pngs/calf.png')),
      MeasureTabBarView(
          bodyPart: 'Thigh', bodyPartModel: ('assets/pngs/thigh.png')),
      MeasureTabBarView(
          bodyPart: 'Inside leg length',
          bodyPartModel: ('assets/pngs/insideleglength.png'))
    ]);
  }

  Widget _measurementSlider() {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.transparent,
      child: SfSlider(
        inactiveColor: Colors.transparent,
        activeColor: Colors.transparent,
        thumbIcon: const VerticalDivider(
          thickness: 1,
          color: Colors.black,
        ),
        min: 1,
        max: 20,
        interval: 1,
        // stepSize: 2,
        enableTooltip: true,
        minorTicksPerInterval: 3,
        showTicks: true,
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
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

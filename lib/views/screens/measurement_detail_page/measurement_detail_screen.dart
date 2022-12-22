import 'package:fits_right/views/common/dialouges/measurement_screen_dialouge.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';

class MeasurementDetail extends StatefulWidget {
  const MeasurementDetail({super.key});

  @override
  State<MeasurementDetail> createState() => _MeasurementDetailState();
}

class _MeasurementDetailState extends State<MeasurementDetail>
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
      body: SafeArea(child: _measurementDetailbody()),
    );
  }

  Widget _measurementDetailbody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(flex: 1, child: _titleBar()),
            Flexible(flex: 1, child: _measurementDetailTabs()),
            Flexible(flex: 9, child: _measurementDetailTabView()),
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

  Widget _measurementDetailTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: SizedBox(
          width: size.width * 0.4,
          height: size.height * 0.043,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicator: RectangularIndicator(
                  bottomLeftRadius: 20,
                  bottomRightRadius: 20,
                  topLeftRadius: 20,
                  topRightRadius: 20,
                  horizontalPadding: 2,
                  verticalPadding: 2,
                  color: AppColors.commonBtnColor),
              controller: _tabController,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(0.8),
                  child: Text(
                    'inches',
                    style: TextStyle(
                        color: Colors.white, fontSize: size.height * 0.015),
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(
                      color: Colors.white, fontSize: size.height * 0.015),
                ),
              ],
            ),
          ),
        ))
      ],
    );
  }

  Widget _measurementDetailTabView() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          bottom: 10,
          left: 200,
          child: UnconstrainedBox(
              child: SizedBox(
            height: size.height * 0.60,
            width: size.width * 0.4,
            child: Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: TabBarView(controller: _tabController, children: [
                SizedBox(
                    child: ListView.separated(
                  itemCount: measurementDetailItemsList.length,
                  itemBuilder: (context, index) => SizedBox(
                    child: SizedBox(
                      height: size.height * 0.038,
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 1,
                              child: SvgPicture.asset(
                                measurementDetailItemsList[index].image,
                                color: const Color(0xFF9CA3AF),
                              )),
                          Expanded(
                            flex: 2,
                            child: Text(
                              measurementDetailItemsList[index].text,
                              style: GoogleFonts.inter(
                                  fontSize: size.height * 0.015,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.commonBtnColor),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              measurementDetailItemsList[index].size,
                              style: textStyle(FontWeight.w500, Colors.black,
                                  size.height * 0.015),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const Divider(color: Color(0xFFBDC6D1), thickness: 1),
                )),
                const Text(''),
              ]),
            ),
          )),
        ),
        Positioned(
            left: 20,
            top: 80,
            child: UnconstrainedBox(
              child: SizedBox(
                height: size.height * 0.51,
                width: size.width * 0.4,
                child: Image.asset(
                  'assets/pngs/insideleglength.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
            )),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => showDialog(
              context: context,
              builder: (context) => const MeasurementScreenDialog(),
            ),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Save and next',
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

List measurementDetailItemsList = [
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Neck',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Sleeve length',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Chest/bust',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Waist',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'High hip',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Low hip',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Belly',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Calf',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Thigh',
    "5'8",
  ),
  MeasurementDetailClass(
    "assets/svgs/appediticon.svg",
    'Inside leg length',
    "5'8",
  ),
];

class MeasurementDetailClass {
  final String image;
  final String text;
  final String size;

  MeasurementDetailClass(
    this.image,
    this.text,
    this.size,
  );
}

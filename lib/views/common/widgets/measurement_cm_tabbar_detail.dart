import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';

class MeasuementCMTabbarDetail extends StatefulWidget {
  const MeasuementCMTabbarDetail({super.key});

  @override
  State<MeasuementCMTabbarDetail> createState() =>
      _MeasuementCMTabbarDetailState();
}

class _MeasuementCMTabbarDetailState extends State<MeasuementCMTabbarDetail> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
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
                    style: textStyle(
                        FontWeight.w500, Colors.black, size.height * 0.015),
                  ),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) =>
            const Divider(color: Color(0xFFBDC6D1), thickness: 1),
      ),
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

import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasureTabBarView extends StatelessWidget {
  const MeasureTabBarView({
    Key? key,
    required this.bodyPart,
    // required this.bodyPartModel,
  }) : super(key: key);

  final String bodyPart;
  // final String bodyPartModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Column(
          children: [
            Flexible(
                child: SizedBox(
              height: size.height * 0.01,
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                bodyPart,
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            )
          ],
        ),
        // Expanded(
        //   child: SizedBox(
        //     child: SvgPicture.asset(bodyPartModel),
        //   ),
        // ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: AppColors.commonBtnColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'inches',
                    style: textStyle(
                        FontWeight.w400, Colors.white, size.height * 0.014),
                  ),
                )),
            SizedBox(
              height: size.height * 0.006,
            ),
            Container(
                decoration: BoxDecoration(
                    //  color: Colors.blue,
                    border:
                        Border.all(width: 1, color: const Color(0xFFBDC6D1)),
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'cm',
                    style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                        size.height * 0.014),
                  ),
                )),
            Flexible(
                child: SizedBox(
              height: size.height * 0.07,
            )),
          ],
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

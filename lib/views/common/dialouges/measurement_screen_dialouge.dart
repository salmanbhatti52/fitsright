import 'dart:async';
import 'package:fits_right/routes/screen_names.dart';
import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementScreenDialog extends StatefulWidget {
  const MeasurementScreenDialog({super.key});

  @override
  State<MeasurementScreenDialog> createState() =>
      _MeasurementScreenDialogState();
}

class _MeasurementScreenDialogState extends State<MeasurementScreenDialog> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAndToNamed(ScreenNames.shoppingScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: SizedBox(height: size.height * 0.04)),
                Flexible(
                  child: Text(
                    'Please wait...',
                    style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                        size.height * 0.026),
                  ),
                ),
                Flexible(child: SizedBox(height: size.height * 0.03)),
                Flexible(child: SvgPicture.asset('assets/svgs/applogo.svg')),
                Flexible(child: SizedBox(height: size.height * 0.04)),
                Flexible(
                  child: Text(
                    'Find the best brands, fit for \n your size.',
                    style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                        size.height * 0.016),
                    textAlign: TextAlign.center,
                  ),
                ),
                Flexible(child: SizedBox(height: size.height * 0.4)),
                Flexible(
                    child: SvgPicture.asset(
                        'assets/svgs/measurementdialogbox.svg')),
              ],
            )),
      ),
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

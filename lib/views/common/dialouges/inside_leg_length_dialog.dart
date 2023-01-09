import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsideLegLengthDialog extends StatefulWidget {
  const InsideLegLengthDialog({super.key});

  @override
  State<InsideLegLengthDialog> createState() => _InsideLegLengthDialogState();
}

class _InsideLegLengthDialogState extends State<InsideLegLengthDialog> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: size.height * 0.33,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: SizedBox(height: size.height * 0.04)),
              Flexible(
                child: Text(
                  'Inside Leg Length',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.024),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                'How to Measure Inside Leg\nLength Size.',
                style: textStyle(FontWeight.w400, const Color(0xFF2B2D42),
                    size.height * 0.018),
                textAlign: TextAlign.center,
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                "Place the top of the tape\nmeasure on your inner thigh,\nstay the closest to the crotch as\npossible. Pull the tape measure\ntight and run it down to the\nbottom of your ankle (just below\nthe ankle bone that sticks out).",
                style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                    size.height * 0.018),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

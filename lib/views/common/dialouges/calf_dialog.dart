import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalfDialog extends StatefulWidget {
  const CalfDialog({super.key});

  @override
  State<CalfDialog> createState() => _CalfDialogState();
}

class _CalfDialogState extends State<CalfDialog> {
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
          height: size.height * 0.32,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: SizedBox(height: size.height * 0.04)),
              Flexible(
                child: Text(
                  'Calf',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.024),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Flexible(
                child: Text(
                  'How to Measure Calf Size.',
                  style: textStyle(FontWeight.w400, const Color(0xFF2B2D42),
                      size.height * 0.018),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                "Sit on a chair and hold your\nbare foot down, holding your leg\nfolded to 90 degrees, in this\nposition with the tape measure\nthe circumference of the calf at\nits widest point, laying the tape\non your skin without tightening.",
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

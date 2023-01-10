import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightDialog extends StatefulWidget {
  const HeightDialog({super.key});

  @override
  State<HeightDialog> createState() => _HeightDialogState();
}

class _HeightDialogState extends State<HeightDialog> {
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
          height: size.height * 0.35,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: SizedBox(height: size.height * 0.04)),
              Flexible(
                child: Text(
                  'Height',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.024),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Flexible(
                child: Text(
                  'How to Measure Height Size.',
                  style: textStyle(FontWeight.w400, const Color(0xFF2B2D42),
                      size.height * 0.018),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                "Make sure your legs are straight,\narms are at sides, and shoulders\nare level. Make sure your looking\nstraight ahead and that the line\nof sight is parallel with the floor.\nTake the measurement while you\nstand with head, shoulders,\nbuttocks, and heels touching a\nflat surface (wall).",
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

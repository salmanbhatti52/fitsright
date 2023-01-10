import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SleeveLengthDialog extends StatefulWidget {
  const SleeveLengthDialog({super.key});

  @override
  State<SleeveLengthDialog> createState() => _SleeveLengthDialogState();
}

class _SleeveLengthDialogState extends State<SleeveLengthDialog> {
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
                  'Sleeve Length',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.024),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                'How to Measure Sleeve\nLength Size.',
                style: textStyle(FontWeight.w400, const Color(0xFF2B2D42),
                    size.height * 0.018),
                textAlign: TextAlign.center,
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                'Start with the end of the tape\nmeasure on the backbone at\nthe nape or your neck. The\nmeasure should then run over\nthe top of the shoulder\n(following a seam line, if one\nwere to be there), down the arm\nto just below the wrist bone.',
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

import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BustDialog extends StatefulWidget {
  const BustDialog({super.key});

  @override
  State<BustDialog> createState() => _BustDialogState();
}

class _BustDialogState extends State<BustDialog> {
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
          height: size.height * 0.3,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: SizedBox(height: size.height * 0.04)),
              Flexible(
                child: Text(
                  'Bust',
                  style: textStyle(FontWeight.w700, AppColors.commonBtnColor,
                      size.height * 0.024),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Flexible(
                child: Text(
                  'How to Measure Bust Size.',
                  style: textStyle(FontWeight.w400, const Color(0xFF2B2D42),
                      size.height * 0.018),
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(child: SizedBox(height: size.height * 0.02)),
              Text(
                "Wrap the measuring tape\nloosely around the fullest part\nof your chest, at nipple level.\nRound to the nearest whole\nnumber. This will become your\nbust measurement.",
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

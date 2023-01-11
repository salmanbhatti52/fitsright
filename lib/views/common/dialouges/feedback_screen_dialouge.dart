import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_button.dart';

class FeedBackScreenDialog extends StatefulWidget {
  const FeedBackScreenDialog({super.key});

  @override
  State<FeedBackScreenDialog> createState() => _FeedBackScreenDialogState();
}

class _FeedBackScreenDialogState extends State<FeedBackScreenDialog> {
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
            height: size.height * 0.26,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: SizedBox(height: size.height * 0.06)),
                Text(
                  'Thanks for submitting \n your feedback. Our \n team will get back to \n you ASAP.',
                  style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                      size.height * 0.018),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.036),
                Flexible(child: _okButton()),
              ],
            )),
      ),
    );
  }

  Widget _okButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () {
              Navigator.pop(context);
            },
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.06,
            width: size.width * 0.7,
            child: Text(
              'OK',
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

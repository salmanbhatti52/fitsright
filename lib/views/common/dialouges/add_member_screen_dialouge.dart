import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_button.dart';

class AddMemeberScreenDialog extends StatefulWidget {
  const AddMemeberScreenDialog({super.key});

  @override
  State<AddMemeberScreenDialog> createState() => _AddMemeberScreenDialogState();
}

class _AddMemeberScreenDialogState extends State<AddMemeberScreenDialog> {
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
                Flexible(child: SizedBox(height: size.height * 0.06)),
                Flexible(
                  child: Text(
                    'He is a member and we \n forwarded an email to \n the member to allow \n you to see their sizes.',
                    style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                        size.height * 0.018),
                    textAlign: TextAlign.center,
                  ),
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

class AddMemeberScreenDialog2 extends StatefulWidget {
  const AddMemeberScreenDialog2({super.key});

  @override
  State<AddMemeberScreenDialog2> createState() =>
      _AddMemeberScreenDialog2State();
}

class _AddMemeberScreenDialog2State extends State<AddMemeberScreenDialog2> {
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
            height: size.height * 0.25,
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(child: SizedBox(height: size.height * 0.05)),
                Flexible(
                  child: Text(
                    'He is not a member, we \n forwarded an email for \n signup.',
                    style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
                        size.height * 0.018),
                    textAlign: TextAlign.center,
                  ),
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

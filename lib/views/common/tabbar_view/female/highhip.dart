import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/dialouges/high_hip_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HighHipTabBarView extends StatefulWidget {
  const HighHipTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<HighHipTabBarView> createState() => _HighHipTabBarViewState();
}

class _HighHipTabBarViewState extends State<HighHipTabBarView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'High Hip',
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset('assets/pngs/highhip_female.png'),
          ),
        ),
        Positioned(
          right: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const HighHipDialog(),
                  );
                },
                child: SvgPicture.asset('assets/svgs/informationicon.svg')),
          ),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/dialouges/thigh_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ThighTabBarView extends StatefulWidget {
  const ThighTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<ThighTabBarView> createState() => _ThighTabBarViewState();
}

class _ThighTabBarViewState extends State<ThighTabBarView> {
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
                'Thigh',
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset('assets/pngs/thigh_male.png'),
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
                    builder: (context) => const ThighDialog(),
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

import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/dialouges/waist_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WaistTabBarView extends StatefulWidget {
  const WaistTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<WaistTabBarView> createState() => _WaistTabBarViewState();
}

class _WaistTabBarViewState extends State<WaistTabBarView> {
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
                'Waist',
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset('assets/pngs/waist_male.png'),
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
                    builder: (context) => const WaistDialog(),
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

import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../dialouges/chest_dialog.dart';

class ChestTabBarView extends StatefulWidget {
  const ChestTabBarView({
    Key? key,
  }) : super(key: key);

  @override
  State<ChestTabBarView> createState() => _ChestTabBarViewState();
}

class _ChestTabBarViewState extends State<ChestTabBarView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Chest',
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ChestDialog(),
                  );
                },
                child: SvgPicture.asset('assets/svgs/informationicon.svg'),
              ),
            ),
          ],
        ),
        SizedBox(
          child: Image.asset('assets/pngs/chest_male.png'),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

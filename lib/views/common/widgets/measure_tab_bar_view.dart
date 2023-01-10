import 'package:fits_right/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import '../dialouges/calf_dialog.dart';
// import '../dialouges/chest_dialog.dart';
// import '../dialouges/height_dialog.dart';
// import '../dialouges/high_hip_dialog.dart';
// import '../dialouges/inside_leg_length_dialog.dart';
// import '../dialouges/low_hip_dialog.dart';
import '../dialouges/neck_dialog.dart';
// import '../dialouges/sleeve_length_dialog.dart';
// import '../dialouges/thigh_dialog.dart';
// import '../dialouges/waist_dialog.dart';

class MeasureTabBarView extends StatefulWidget {
  const MeasureTabBarView({
    Key? key,
    required this.bodyPart,
    required this.bodyPartModel,
  }) : super(key: key);

  final String bodyPart;
  final String bodyPartModel;

  @override
  State<MeasureTabBarView> createState() => _MeasureTabBarViewState();
}

class _MeasureTabBarViewState extends State<MeasureTabBarView> {
  // int _selectedIndex = 0;
  // _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     switch (_selectedIndex) {
  //       case 0:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const NeckDialog(),
  //         );
  //         break;
  //       case 1:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const SleeveLengthDialog(),
  //         );
  //         break;
  //       case 2:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const ChestDialog(),
  //         );
  //         break;
  //       case 3:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const WaistDialog(),
  //         );
  //         break;
  //       case 4:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const LowHipDialog(),
  //         );
  //         break;
  //       case 5:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const HighHipDialog(),
  //         );
  //         break;
  //       case 6:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const HeightDialog(),
  //         );
  //         break;
  //       case 7:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const CalfDialog(),
  //         );
  //         break;
  //       case 8:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const ThighDialog(),
  //         );
  //         break;
  //       case 9:
  //         showDialog(
  //           context: context,
  //           builder: (context) => const InsideLegLengthDialog(),
  //         );
  //         break;
  //     }
  //   });
  // }

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
                widget.bodyPart,
                style: textStyle(FontWeight.w600, AppColors.commonBtnColor,
                    size.height * 0.018),
              ),
            ),
          ],
        ),
        Expanded(
          child: SizedBox(
            child: Image.asset(widget.bodyPartModel),
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
                    builder: (context) => const NeckDialog(),
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

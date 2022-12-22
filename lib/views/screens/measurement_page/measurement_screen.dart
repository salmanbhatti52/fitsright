import 'package:fits_right/views/common/widgets/app_drawer.dart';
import 'package:fits_right/views/common/widgets/app_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/screen_names.dart';
import '../../../utils/app_colors.dart';
import '../../common/widgets/my_button.dart';
import '../../common/widgets/rectangle_image_container.dart';

class Measurements extends StatefulWidget {
  const Measurements({super.key});

  @override
  State<Measurements> createState() => _MeasurementsState();
}

class _MeasurementsState extends State<Measurements> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(child: _measurementScreenBody()),
    );
  }

  Widget _measurementScreenBody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: _titleBar()),
            Flexible(flex: 5, child: _mainSvg()),
            Flexible(flex: 2, child: _measurementType()),
            Flexible(flex: 1, child: _nextButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppMenuButton(
            onTap: () => Scaffold.of(context).openDrawer(),
          );
        }),
        SizedBox(
          width: size.width * 0.195,
        ),
        Flexible(
            child: Text(
          'Measurement',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _mainSvg() {
    return SvgPicture.asset(r'assets/svgs/measurepgsvg.svg');
  }

  Widget _measurementType() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
            child: RectangleimageContainer(
                picture: Image.asset(r'assets/pngs/manual.png'),
                gender: 'Manual')),
        Flexible(
            child: Container(
          height: size.height * 0.50,
          width: size.width * 0.43,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Image.asset(r'assets/pngs/commingsoonpng.png'),
              Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.5),
                child: Text(
                  'Coming \n Soon',
                  style: GoogleFonts.inter(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.takeMeasurementScreen),
            radius: 15,
            color: AppColors.commonBtnColor,
            height: size.height * 0.07,
            width: size.width,
            child: Text(
              'Next',
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

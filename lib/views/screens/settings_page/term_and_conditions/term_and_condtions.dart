import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/app_colors.dart';
import '../../../common/widgets/back_button.dart';

class TermAndConditionsScreen extends StatelessWidget {
  const TermAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: _termAndConditionsBody(size)),
    );
  }

  Widget _termAndConditionsBody(Size size) {
    return SizedBox(
      height: size.height,
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03, vertical: size.height * 0.03),
          child: Column(
            children: [
              Flexible(child: _titleRow(size)),
              SizedBox(
                height: size.height * 0.05,
              ),
              Expanded(flex: 15, child: _description(size)),
            ],
          )),
    );
  }

  Widget _description(Size size) {
    return Text(
        style: textStyle(FontWeight.w400, Colors.black, size.height * 0.019),
        '''Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus. Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aenean sapien leo, maximus nec magna vel, gravida auctor quam. Cras congue massa massa, id luctus elit ultricies at. Maecenas in neque justo. 
Posuere metus. Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Fusce aliquet condimentum arcu id elementum.Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus. Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus. Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aenean sapien leo, maximus nec magna vel, gravida auctor quam.. Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Sed vulputate pellentesque lectus, id luctus turpis interdum vel.....''');
  }

  Widget _titleRow(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Get.back(),
          );
        }),
        SizedBox(
          width: size.width * 0.17,
        ),
        Flexible(
            child: Text(
          'Terms & Conditions',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }
}

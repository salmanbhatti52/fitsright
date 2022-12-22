import 'package:fits_right/utils/app_colors.dart';
import 'package:fits_right/views/common/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../routes/screen_names.dart';
import '../../common/widgets/my_button.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  late Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: policybody(),
    ));
  }

  Widget policybody() {
    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(flex: 3, child: _titleRow()),
            Expanded(
                flex: 16, child: SingleChildScrollView(child: _policyText())),
            Flexible(flex: 1, child: _accept()),
            Flexible(flex: 2, child: _nextButton()),
          ],
        ),
      ),
    );
  }

  Widget _titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Builder(builder: (context) {
          return AppBackBtn(
            onTap: () => Scaffold.of(context).openDrawer(),
          );
        }),
        SizedBox(
          width: size.width * 0.15,
        ),
        Flexible(
            child: Text(
          'Terms and conditions',
          style: textStyle(
              FontWeight.w700, AppColors.commonBtnColor, size.height * 0.025),
        )),
      ],
    );
  }

  Widget _policyText() {
    return SizedBox(
      height: size.height * 0.9,
      child: Text(
        overflow: TextOverflow.ellipsis,
        maxLines: 200,
        textAlign: TextAlign.start,
        '''Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus.Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aenean sapien leo, maximus nec magna vel, gravida auctor quam. Cras congue massa massa, id luctus elit ultricies at. Maecenas in neque justo.Posuere metus.Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Fusce aliquet condimentum arcu id elementum.Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus. Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aenean sapien leo, maximus nec magna vel, gravida auctor quam.Aenean sapien leo, maximus nec magna vel, gravida auctor quam.Aenean sapien leo, maximus nec magna vel, gravida auctor quam.Aenean sapien leo, maximus nec magna vel, gravida auctor quam Sed vulputate pellentesque lectus, id luctus turpis interdum vel. Fusce aliquet condimentum arcu id elementum.Aliquam a dui vel justo fringilla euismod id id enim. Nunc non semper tellus. Pellentesque vitae tellus non dui fermentum hendrerit. In vel imperdiet mi. Aliquam erat volutpat. Cras dapibus orci eu eros tempus efficitur. Nulla rhoncus arcu nec dictum condimentum. Aenean sapien leo, maximus nec magna vel, gravida auctor quam Aenean sapien leo, maximus nec magna vel, gravida auctor quam....''',
        style: textStyle(FontWeight.w400, Colors.black, size.height * 0.019),
      ),
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _accept() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: Checkbox(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            side: BorderSide(
              color: Colors.grey.withOpacity(0.4),
              style: BorderStyle.solid,
            ),
            value: false,
            onChanged: (value) => false,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(
            'Accept Terms and conditions',
            style: textStyle(
                FontWeight.w400, const Color(0xFF8D99AE), size.height * 0.016),
          ),
        ),
      ],
    );
  }

  Widget _nextButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: MyButton(
            onTap: () => Get.toNamed(ScreenNames.homeScreen),
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
}

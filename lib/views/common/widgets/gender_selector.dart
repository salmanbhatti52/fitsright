import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelectWidget extends StatefulWidget {
  const GenderSelectWidget({super.key});

  @override
  State<GenderSelectWidget> createState() => _GenderSelectWidgetState();
}

class _GenderSelectWidgetState extends State<GenderSelectWidget> {
  List<GenderRadioModel> genderData = <GenderRadioModel>[];

  @override
  void initState() {
    super.initState();

    genderData.add(
        GenderRadioModel(false, 'assets/svgs/selectgenderpgsvg2.svg', 'Male'));
    genderData.add(GenderRadioModel(
        false, 'assets/svgs/selectgenderpgsvg3.svg', 'Female'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: genderData.length,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (var element in genderData) {
                element.isSelectedGender = false;
              }
              genderData[index].isSelectedGender = true;
            });
          },
          child: GenderRadioItem(genderData[index]),
        );
      },
    );
  }
}

class GenderRadioItem extends StatelessWidget {
  final GenderRadioModel _item;
  const GenderRadioItem(this._item, {super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.50,
            width: size.width * 0.43,
            decoration: BoxDecoration(
                border: Border.all(
                  color: _item.isSelectedGender
                      ? const Color(0xFF3541A5)
                      : const Color(0xFFBDC6D1),
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(_item.image),
                _verticalSpace(size.height * 0.005),
                Text(
                  _item.text,
                  style: textStyle(
                      FontWeight.w600,
                      _item.isSelectedGender
                          ? const Color(0xFF3541A5)
                          : const Color(0xFF000000),
                      size.height * 0.020),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle textStyle(FontWeight weight, Color color, double size) {
    return GoogleFonts.inter(fontWeight: weight, color: color, fontSize: size);
  }

  Widget _verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }
}

class GenderRadioModel {
  bool isSelectedGender;
  final String image;
  final String text;

  GenderRadioModel(this.isSelectedGender, this.image, this.text);
}

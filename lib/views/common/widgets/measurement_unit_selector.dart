import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasurementUnitWidget extends StatefulWidget {
  const MeasurementUnitWidget({super.key});

  @override
  State<MeasurementUnitWidget> createState() => _MeasurementUnitWidgetState();
}

class _MeasurementUnitWidgetState extends State<MeasurementUnitWidget> {
  List<UnitRadioModel> unitData = <UnitRadioModel>[];

  @override
  void initState() {
    super.initState();

    unitData.add(UnitRadioModel(true, 'inches'));
    unitData.add(UnitRadioModel(false, 'cm'));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: unitData.length,
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            setState(() {
              for (var element in unitData) {
                element.isSelectedUnit = false;
              }
              unitData[index].isSelectedUnit = true;
            });
          },
          child: GenderRadioItem(unitData[index]),
        );
      },
    );
  }
}

class GenderRadioItem extends StatefulWidget {
  final UnitRadioModel _item;
  const GenderRadioItem(this._item, {super.key});

  @override
  State<GenderRadioItem> createState() => _GenderRadioItemState();
}

class _GenderRadioItemState extends State<GenderRadioItem> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: size.width * 0.16,
          height: size.height * 0.04,
          decoration: BoxDecoration(
              color: widget._item.isSelectedUnit
                  ? const Color(0xFF3541A5)
                  : Colors.transparent,
              border: Border.all(width: 1, color: const Color(0xFFBDC6D1)),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              widget._item.text,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: widget._item.isSelectedUnit
                      ? Colors.white
                      : const Color(0xFF8D99AE),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.02,
        ),
        // Container(
        //   width: size.width * 0.16,
        //   height: size.height * 0.04,
        //   decoration: BoxDecoration(
        //       //  color: Colors.blue,
        //       border: Border.all(width: 1, color: const Color(0xFFBDC6D1)),
        //       borderRadius: BorderRadius.circular(20)),
        //   child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Center(
        //       child: Text(
        //         'cm',
        //         style: textStyle(FontWeight.w400, const Color(0xFF8D99AE),
        //             size.height * 0.014),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );

    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 10),
    //       child: Container(
    //         alignment: Alignment.center,
    //         height: size.height * 0.50,
    //         width: size.width * 0.43,
    //         decoration: BoxDecoration(
    //             border: Border.all(
    //               color: _item.isSelectedUnit
    //                   ? const Color(0xFF3541A5)
    //                   : const Color(0xFFBDC6D1),
    //             ),
    //             shape: BoxShape.rectangle,
    //             borderRadius: BorderRadius.circular(10)),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Text(
    //               _item.text,
    //               style: textStyle(
    //                   FontWeight.w600,
    //                   _item.isSelectedUnit
    //                       ? const Color(0xFF3541A5)
    //                       : const Color(0xFF000000),
    //                   size.height * 0.020),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}

class UnitRadioModel {
  bool isSelectedUnit;
  final String text;

  UnitRadioModel(this.isSelectedUnit, this.text);
}

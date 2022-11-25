// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class MyDropDownButton extends StatelessWidget {
  const MyDropDownButton({
    Key? key,
    required this.width,
    required this.selection,
  }) : super(key: key);

  final double width;
  final String selection;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var item1 = const DropdownMenuItem(
        child: Text(
      '',
    ));
    return Container(
      height: size.height * 0.055,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.3))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(selection)),
            Flexible(
              child: DropdownButton(
                iconSize: 20,
                underline: Container(
                  color: Colors.transparent,
                ),
                items: [item1],
                onChanged: (value) => Text(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

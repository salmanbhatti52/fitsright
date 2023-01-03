// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDropDownYearButton extends StatefulWidget {
  const MyDropDownYearButton({
    Key? key,
    required this.width,
    required this.selection,
  }) : super(key: key);

  final double width;
  final String selection;

  @override
  State<MyDropDownYearButton> createState() => _MyDropDownYearButtonState();
}

class _MyDropDownYearButtonState extends State<MyDropDownYearButton> {
  List<DropdownMenuItem> getYear() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String data in year) {
      var newItem = DropdownMenuItem(
        value: data,
        child: Text(data),
      );
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  @override
  Widget build(BuildContext context) {
    getYear();
    var size = MediaQuery.of(context).size;
    String? selectedYear;
    return Container(
      height: size.height * 0.055,
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFBDC6D1))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.selection,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                    fontSize: size.height * 0.015,
                    color: const Color(0xFF9CA3AF)),
              ),
            ),
            Flexible(
              child: DropdownButton(
                icon: SvgPicture.asset('assets/svgs/birthdaydropdownarrow.svg'),
                iconSize: 20,
                style: GoogleFonts.inter(
                    fontSize: size.height * 0.015,
                    color: const Color(0xFF9CA3AF)),
                underline: Container(
                  color: Colors.transparent,
                ),
                value: selectedYear,
                items: getYear(),
                onChanged: (newValue) {
                  setState(() {
                    selectedYear = newValue!;
                    print(selectedYear);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> year = [
  '1950',
  '1951',
  '1952',
  '1953',
  '1954',
  '1955',
  '1956',
  '1957',
  '1958',
  '1959',
  '1960',
  '1961',
  '1962',
  '1963',
  '1964',
  '1965',
  '1966',
  '1967',
  '1968',
  '1969',
  '1970',
  '1971',
  '1972',
  '1973',
  '1974',
  '1975',
  '1976',
  '1977',
  '1978',
  '1979',
  '1980',
  '1981',
  '1982',
  '1983',
  '1984',
  '1985',
  '1986',
  '1987',
  '1988',
  '1989',
  '1990',
  '1991',
  '1992',
  '1993',
  '1994',
  '1995',
  '1996',
  '1997',
  '1998',
  '1999',
  '2000',
  '2001',
  '2002',
  '2003',
  '2004',
  '2005',
  '2006',
  '2007',
  '2008',
  '2009',
  '2010',
  '2011',
  '2012',
  '2013',
  '2014',
  '2015',
  '2016',
  '2017',
  '2018',
  '2019',
  '2020',
  '2021',
  '2022',
  '2023',
  '2024',
  '2025',
  '2026',
  '2027',
  '2028',
  '2029',
  '2030',
  '2031',
  '2032',
  '2033',
  '2034',
  '2035',
  '2036',
  '2037',
  '2038',
  '2039',
  '2040',
  '2041',
  '2042',
  '2043',
  '2044',
  '2045',
  '2046',
  '2047',
  '2048',
  '2049',
  '2050',
];

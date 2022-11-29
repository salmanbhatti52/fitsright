import 'package:flutter/material.dart';

class MeasurementDetail extends StatefulWidget {
  const MeasurementDetail({super.key});

  @override
  State<MeasurementDetail> createState() => _MeasurementDetailState();
}

class _MeasurementDetailState extends State<MeasurementDetail> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: _measurementDetailbody()),
    );
  }

  Widget _measurementDetailbody() {
    return SizedBox(
      height: size.height,
    );
  }
}

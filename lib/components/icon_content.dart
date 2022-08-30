import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableChild extends StatelessWidget {
  const ReusableChild({Key? key, required this.icon, required this.label}) : super(key: key);
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(label, style:kLabelTextStyle, ),
      ],
    );
  }
}
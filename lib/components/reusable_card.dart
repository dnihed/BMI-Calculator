import 'package:flutter/material.dart';

class ReausableCard extends StatelessWidget {

  ReausableCard({required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final cardChild;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
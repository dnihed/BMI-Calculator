import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.bmiResult , required this.interpretation , required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style:kTitleTextStyle ,),
            ),),
        Expanded(
            flex: 5,
            child: ReausableCard(colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(), style: kResultTextWidget,),
                  Text(bmiResult, style: kBMITextStyle,),
                  Text(interpretation.toUpperCase(),textAlign: TextAlign.center, style: kBodyTextStyle,),
                ],),
        ),),
          BottomButton(buttonTitle: 'RE-CALCULATE', onTap: () {
            Navigator.pop(context ) ;},),
      ],),
    );
  }
}

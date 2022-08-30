import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_app/calculator_brain.dart';

enum Gender{ male, female,}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender ? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(child: ReausableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                    colour : selectedGender == Gender.male ? kActiveCardColor : kInactiveCardColor,
                  cardChild: const ReusableChild(icon: FontAwesomeIcons.mars,label: 'MALE'),),),
                  Expanded(child: ReausableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    colour : selectedGender == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: const ReusableChild(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),),
                ],
            ),
          ),
          Expanded(child: ReausableCard(colour : kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              const Text('HEIGHT', style: kLabelTextStyle,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                Text(height.toString(), style: kNumberTextStyle,),
                const Text('Cm', style: kLabelTextStyle,),
              ],),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(value: height.toDouble(),
                  min: 120.0,
                  max: 220.0,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },),
                ),
            ],),
          ),),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(child: ReausableCard(colour : kActiveCardColor,
                  cardChild: Column(
                    children: <Widget>[
                      const Text('WEIGHT', style: kLabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(weight.toString(), style: kNumberTextStyle,),
                          const Text('Kg', style: kLabelTextStyle,),
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight = weight-1;
                                });
                              },),
                          const SizedBox(width: 10.0,),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight = weight+1;
                                });
                              }),
                        ],
                      ),

                    ],
                  ),),),
                  Expanded(child: ReausableCard(colour : kActiveCardColor,
                    cardChild: Column(
                      children: <Widget>[
                        const Text('WEIGHT', style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(age.toString(), style: kNumberTextStyle,),
                            const Text('Yo', style: kLabelTextStyle,),
                          ],),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),

                      ],
                    ),),),
                ],
              ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: () {
            CalculatorBrain calc= CalculatorBrain(height: height, weigth: weight);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            ))) ;},),
        ],

      ),
    );
  }
}




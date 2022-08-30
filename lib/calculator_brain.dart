import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weigth});
  final int height;
  final int weigth;
  late double _bmi;

  String calculateBMI(){
    _bmi=weigth/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'overweigth';
    }
    else if(_bmi>18.5){
      return 'normal';
    }
    else{
      return 'underweight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
    else if(_bmi>=18.5 && _bmi<25){
      return 'You have a normal body weight. Good job!';
    }
    else{
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
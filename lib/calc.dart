import 'dart:math';

class Calc {
  Calc({this.weight, this.height});
  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Yuo have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'Yuo have a normal body weight. Good job';
    } else {
      return 'Yuo have a lower normal body weight. You can a bit more';
    }
  }
}

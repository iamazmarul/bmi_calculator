import 'dart:math';

class CalculateBMI {
  final int height;
  final int weight;
  double _bmi;

  CalculateBMI({required this.height, required this.weight}) : _bmi = 0.0;

  String calcBMI() {
    if (height <= 0) {
      return "Invalid height";
    }

    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1); // Limit decimal places to 1.
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String feedBack() {
    if (_bmi >= 25) {
      return "You have a higher than normal body weight. Try to exercise more. It is recommended for those who are overweight (BMI of 25 to 29.90).";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Congratulations!";
    } else {
      return "Eat more frequently. You are underweight. Eating more may help you feel full faster.";
    }
  }
}

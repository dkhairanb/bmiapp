// ignore_for_file: non_constant_identifier_names

import 'dart:math';

class Logic {
  double bmiCalculation({required int height, required int weight}) {
    /*required adalah data yang dibutuhka dan wajib ada*/
    double bmi = weight / pow(height / 100, 2); /*formula bmi*/
    return bmi;
  }
}

String pressedGender(int bmiResult, int selectedGender) {
  /*logic untuk menentukan gender yang dipilih user*/
  if (selectedGender == 0) {
    return maleBmi(bmiResult); /*mengeluarkan pesan untuk male*/
  } else {
    return femaleBmi(bmiResult); /*mengeluarkan pesan untuk female*/
  }
}

String femaleBmi(int bmiResult) {
  if (bmiResult < 17) {
    return 'Underweight';
  } else if (17 <= bmiResult && bmiResult < 23) {
    return 'Normal';
  } else if (23 <= bmiResult && bmiResult < 27) {
    return 'Overweight';
  } else if (bmiResult >= 27) {
    return 'Obese';
  } else {
    return 'error';
  }
}

String maleBmi(int bmiResult) {
  if (bmiResult < 18) {
    return 'Underweight';
  } else if (18 <= bmiResult && bmiResult < 25) {
    return 'Normal';
  } else if (25 <= bmiResult && bmiResult < 27) {
    return 'Overweight';
  } else if (bmiResult >= 27) {
    return 'Obese';
  } else {
    return 'error';
  }
}

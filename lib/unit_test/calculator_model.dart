class CalculatorModel {
  int addTwoNumbers(int num1, int num2) {
    return num1 + num2;
  }

  //two positive numbers ==> function
  //two negative numbers
  //one positive and one negative
  //zero and number
  //zero and zero

  double divideTwoNumbers(int num1, int num2) {
    if (num2 == 0) {
      return 0;
    }
    return num1 / num2;
  }

  //divide any numberr by 1
  //divide any number by 0
}

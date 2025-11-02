import 'package:elevate_cycle4/unit_test/calculator_model.dart';
import 'package:test/test.dart';

void main() {
  //AAA
  //ARRANGE ==> SETUP DEPENDENCIES
  //ACT ==> CALL THE FUNCTION that you want to test
  //ASSERT ==> CHECK and verify THE RESULT

  //setUp ==> run before each test
  //setUpAll ==> run once before all tests
  //tearDown
  //tearDownAll
  late CalculatorModel calculatorModel;
  setUp(() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>Setup Function");
  });

  setUpAll(() {
    calculatorModel = CalculatorModel();

    print(">>>>>>>>>>>>>>>>>>>>>>>>>>setUpAll Function");
  });
  tearDown(() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>tearDown Function");
  });

  tearDownAll(() {
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>tearDownAll Function");
  });

  group("Add Function Test Cases", () {
    test('Test Add Function with two positive numbers', () {
      //ARRANGE
      int num1 = 2;
      int num2 = 5;

      //ACT - execute
      int result = calculatorModel.addTwoNumbers(num1, num2); // positive 7

      //ASSERT expected(result , matcher)
      expect(result, isPositive);
      expect(result, 7);
    });

    test('Test Add Function with zero and zero', () {
      //ARRANGE
      int num1 = 0;
      int num2 = 0;

      //ACT - execute
      int result = calculatorModel.addTwoNumbers(num1, num2); //Zero

      //Assert
      expect(result, isZero);
    });

    test('Test Add Function with two negative numbers', () {
      //ARRANGE
      int num1 = -8;
      int num2 = -1;

      //ACT - execute
      int result = calculatorModel.addTwoNumbers(num1, num2); // positive 7

      //ASSERT expected(result , matcher)
      expect(result, isNegative);
      expect(result, -9);
    });
  });
  group("Divide Function Test Cases", () {
    test('Test Divide Function with positive number on 1', () {
      //ARRANGE
      int num1 = 8;
      int num2 = 1;

      //ACT - execute
      double result = calculatorModel.divideTwoNumbers(num1, num2);

      //ASSERT expected(result , matcher)
      expect(result, num1);
      expect(result, isPositive);
    });
    test('Test Divide Function with any number on 0', () {
      //ARRANGE
      int num1 = 8;
      int num2 = 0;

      //ACT - execute
      double result = calculatorModel.divideTwoNumbers(num1, num2);

      //ASSERT expected(result , matcher)
      expect(result, num2);
      expect(result, isZero);
    });
  });
}

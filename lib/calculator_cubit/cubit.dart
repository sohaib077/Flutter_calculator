
import 'package:culculator/calculator_cubit/states.dart';
import 'package:culculator/calculator_screen/calculator_screen.dart';
import 'package:culculator/gpa_calculator/gpa_screen/gpa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bmi_calculator/bmi_screen/bmi_screen.dart';
import '../calculator_layout/calculator_layout.dart';
import '../shared/components/components.dart';
import '../shared/network/remote/cashe_helper.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(CalculatorInitialState());

  static CalculatorCubit get(context) => BlocProvider.of(context);

  String output = '0';
  String num1 = '';
  String num2 = '';
  String operator = '';
  bool isAnswered = false;

  List<Widget> screens = [
    BmiScreen(),
    CalculatorScreen(),
    GpaScreen(),
  ];

  int currentIndex = 1;

  void changeBottomNav(index) {
    currentIndex = index;
    emit(CalculatorChangeBottomNav());
  }

  void typeNumbers(String number) {
    checker = true;

    if (isAnswered == true) clear();

    if (output == '0' && number != '.') output = '';

    if (output.contains('.') && number == '.')
      output = output;
    else
      output += number;

    emit(CalculatorTypeNumbers());
  }

  void operations(String _operator) {
    checker = true;

    try {
      if (operator != '') answer();
    } catch (e) {
      operator = _operator;
      emit(CalculatorOperations());
      return;
    }

    isAnswered = false;
    num1 = output;
    output = '';
    operator = _operator;

    emit(CalculatorOperations());
  }

  void clear() {
    checker = true;

    output = '0';
    operator = '';
    num1 = '';
    num2 = '';
    isAnswered = false;
    emit(CalculatorClear());
  }

  void changeSign() {
    checker = true;

    isAnswered = false;
    if (output != '0') {
      output = (double.parse(output) * -1).toString();

      if (output.endsWith('.0')) output = output.replaceAll('.0', '');

      emit(CalculatorChangeSign());
    }
  }

  void delete() {
    checker = true;

    isAnswered = false;

    if (output.length > 1)
      output = output.substring(0, output.length - 1);
    else if (output.length == 1) output = '0';

    emit(CalculatorDelete());
  }

  bool checker = true;

  void answer() {
    checker = false;
    num2 = ' ' + operator + ' ' + output;
    if (num1 != '' && operator != '') {
      if (operator == '+') {
        output = (double.parse(num1) + double.parse(output)).toString();
      } else if (operator == '-') {
        output = (double.parse(num1) - double.parse(output)).toString();
      } else if (operator == '×') {
        output = (double.parse(num1) * double.parse(output)).toString();
      } else if (operator == '÷') {
        output = (double.parse(num1) / double.parse(output)).toString();
      } else {
        output = (double.parse(num1) % double.parse(output)).toString();
      }
      isAnswered = true;
      // num1 = output ;
      operator = '';
    }

    if (output.endsWith('.0')) output = output.replaceAll('.0', '');

    if (output == 'NaN') output = 'Error';

    emit(CalculatorAnswer());
  }

  bool isLast = false;

  void submit(context) {
    CasheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(context, CalculatorLayout());
      }
    });
    emit(CalculatorSubmitState());
  }

  void pageChanged(index, length) {
    if (index == length)
      isLast = true;
    else
      isLast = false;
    emit(CalculatorChangePageIndexState());
  }
}

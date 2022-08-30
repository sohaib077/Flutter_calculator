import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:culculator/calculator_cubit/states.dart';
import 'package:culculator/calculator_screen/calculator_screen.dart';
import 'package:culculator/gpa_calculator/gpa_screen/gpa_screen.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bmi_calculator/bmi_screen/bmi_screen.dart';

class CalculatorCubit extends Cubit<CalculatorStates>{

  CalculatorCubit() : super(CalculatorInitialState());

  static CalculatorCubit get(context) => BlocProvider.of(context) ;

  List <Widget> screens =[
    BmiScreen(),
    CalculatorScreen(),
    GpaScreen(),
  ] ;

  int currentIndex = 1 ;

  void changeBottomNav(index){
    currentIndex = index ;
    emit(CalculatorChangeBottomNav());
  }


  void typeNumbers(String number){

    if(isAnswered == true)
      clear();

    if(output == '0' && number != '.' )
      output = '' ;

    if(output.contains('.') && number == '.')
        output = output ;
      else
        output += number ;

    emit(CalculatorTypeNumbers());
  }

  void operations(String _operator){
    if(operator != '')
      answer() ;
    isAnswered = false ;
    num1 = output ;
    output = '' ;
    operator = _operator ;
    print(num1) ;
    emit(CalculatorOperations());
  }

  void clear(){
    output = '0' ;
    isAnswered = false ;
    emit(CalculatorClear());
  }

  void changeSign() {
    isAnswered = false ;
    if (output != '0') {
      output = (double.parse(output) * -1).toString();

      if(output.endsWith('.0'))
        output = output.replaceAll('.0', '') ;

      emit(CalculatorChangeSign());
    }
  }

  void delete(){
    isAnswered = false ;

    if(output.length > 1)
      output = output.substring(0, output.length-1) ;

    else if(output.length == 1)
      output = '0' ;

    emit(CalculatorDelete());
  }

    void answer (){

      num2 = ' ' + operator +' '+ output ;

      if(num1 != '' && operator != ''){
        if(operator == '+') {
          output = (double.parse(num1) + double.parse(output)).toString();

        }

        else if(operator == '-') {
          output = (double.parse(num1) - double.parse(output)).toString();
        }

        else if(operator == '×') {
          output = (double.parse(num1) * double.parse(output)).toString();
        }

        else if(operator == '÷') {
          output = (double.parse(num1) / double.parse(output)).toString();
        }

        else{
          output = (double.parse(num1) % double.parse(output)).toString();
        }
        isAnswered = true ;
        // num1 = output ;
        operator = '' ;
      }

      if(output.endsWith('.0'))
           output = output.replaceAll('.0', '') ;


      emit(CalculatorAnswer());

    }


  }


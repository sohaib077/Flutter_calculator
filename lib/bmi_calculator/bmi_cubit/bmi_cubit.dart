import 'package:bloc/bloc.dart';
import 'package:culculator/bmi_calculator/bmi_cubit/bmi_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';

class BmiCubit extends Cubit<BmiStates> {

  BmiCubit() : super(BmiInitialState());

  static BmiCubit get(context) => BlocProvider.of(context) ;

  bool isMale = true ;
  int height = 170 ;
  int weight = 110 ;
  String result = '' ;
  String resultStatus = '' ;
  String losedWeight = '' ;
  String gainedWeight = '' ;
  Color resultColor = Colors.green ;


  void changeGender(String gender){
    if(gender == 'male')
      isMale = true ;
    else
      isMale = false ;

    emit(BmiGenderState());
  }

  void changeHeight(int _height){
    height = _height ;
    emit(BmiChangeHeightState());

  }

  void changeWeight(int _weight){
    weight = _weight ;
    emit(BmiChangeWeightState());

  }

  Future calculateResult()async
  {

    result = ( weight / (height*height*0.0001) ).toString();

    if(result.toString().contains('.0') )
      result = double.parse(result).round().toString() ;
    else
      result = double.parse(result).toStringAsFixed(1)  ;

    if(result.toString().contains('.0') )
      result = double.parse(result).round().toString() ;

    if(double.parse(result) >= 25 )
        losedWeight = ((height * height * 0.0001) * (double.parse(result) - 24.5 )).round().toString() ;
    else if(double.parse(result) < 18.5 )
      gainedWeight = ((height * height * 0.0001) * ( 19 - double.parse(result)  )).round().toString() ;

    emit(BmiCalculateResultState());
  }

  Future calculateResultStatus() async
  {
    if (double.parse(result) < 18.5){
      resultStatus = 'Underweight' ;
      resultColor = Colors.yellow ;
    }
    else if (double.parse(result) >= 18.5 && double.parse(result) < 25 ){
      resultStatus = 'Normal' ;
      resultColor = Colors.green ;
    }
    else if (double.parse(result) >= 25 && double.parse(result) < 30 ){
      resultStatus = 'Overweight' ;
      resultColor = Colors.orange ;
    }
    else if (double.parse(result) >= 30 && double.parse(result) < 35 ){
      resultStatus = 'Obesity Ⅰ ' ;
      resultColor = Colors.deepOrange ;
    }
    else if (double.parse(result) >= 35 && double.parse(result) < 40 ){
      resultStatus = 'Obesity Ⅱ ' ;
      resultColor = Colors.red ;
    }
    else{
      resultStatus = 'Obesity Ⅲ ' ;
      resultColor = Colors.red ;
    }

    emit(BmiCalculateResultStatusState());
  }

  void repeat (context){
    isMale = true ;
    height = 170 ;
    weight = 110 ;
    result = '' ;
    resultStatus = '' ;
    losedWeight = '' ;
    gainedWeight = '' ;
    resultColor = Colors.green ;

    Navigator.pop(context);

    emit(BmiRepeatState());
  }

}
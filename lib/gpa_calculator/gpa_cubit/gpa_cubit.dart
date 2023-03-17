import 'package:bloc/bloc.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:culculator/gpa_calculator/gpa_result_screen/gpa_result_screen.dart';
import 'package:culculator/shared/components/components.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/network/remote/cashe_helper.dart';

class GpaCubit extends Cubit <GpaStates>{

  GpaCubit() : super(GpaInitialState());

  static GpaCubit get(context) => BlocProvider.of(context) ;

  List<String> grades =[
    ' A+','A',' A-',
    ' B+','B',' B-',
    ' C+','C',' C-',
    ' D+','D',' D-',
    'F',
  ];

  String selectedItem = '' ;
  int coursesNumber = 5 ;

  var gradeValues = new List.filled(100, 'null', growable: false) ;
  List<TextEditingController> controller = [];
  List<TextEditingController> settingController = [];

  List<String> gradeResults = [] ;
  List<String> creditResults = [] ;

  bool isCalculated = true ;
  double totalPoints = 0;
  double totalCredits = 0;
  double gpaResult = 0 ;

  // Map <String , dynamic> points = {
  //   'A+' : 4 , 'A' : 4 , 'A-' : 3.7 ,
  //   'B+' : 3.3 , 'B' : 3 , 'B-' : 2.7 ,
  //   'C+' : 2.3 , 'C' : 2 , 'C-' : 1.7 ,
  //   'D+' : 1.3 , 'D' : 1 , 'D-' : 0.7 ,
  //   'F' : 0 ,
  // } ;
  //


  void changeCoursesNumber (String status , index){

      if (status == 'add'){
        if(coursesNumber < 99)
        coursesNumber++;
      }

      else{
        if(coursesNumber > 1){
          coursesNumber--;
          gradeValues[index] = 'null' ;
          controller[index].text = '' ;
        }

        else
          showToast(text: 'Can\'t be less than 1', state: ToastStates.ERROR);
      }


    emit(GpaChangeCoursesNumberState());
  }

  void changeGradeValue(value, index) {
    gradeValues[index] = value.toString() ;
    emit(GpaChangeGradeValueState());
  }

  void setControllers(){
    for (int i = 1; i < 100; i++)
      controller.add(TextEditingController());

    for (int i = 0; i < 13; i++) {
      settingController.add(TextEditingController());
      settingController[i].text = points.values.elementAt(i).toString();
    }

    emit(GpaSetControllersState());
  }

  Future <bool> fillResult() async
  {
    emit(GpaResultLoadingState());
    gradeResults = [] ;
    creditResults = [] ;
    isCalculated = true ;

    for(int i = 0 ;  i < coursesNumber ; i++){
      if(gradeValues[i]!= 'null' && controller[i].text != '' ){
        gradeResults.add(gradeValues[i]) ;
        creditResults.add(controller[i].text) ;
      }
      else if(gradeValues[i]== 'null' && controller[i].text != ''){
        showToast(text: 'Please pick the missed grade field', state: ToastStates.ERROR);
        isCalculated = false ;
        return await isCalculated ;
      }
      else if(gradeValues[i] != 'null' && controller[i].text == ''){
        showToast(text: 'Please pick the missed credit field', state: ToastStates.ERROR);
        isCalculated = false ;
        return await isCalculated ;

      }
    }
    if(gradeResults.length == 0){
      showToast(
        text: 'Please fill fields first to get results',
        state: ToastStates.ERROR,
      );
      isCalculated = false ;
      return await isCalculated ;
    }
    return await isCalculated ;
  }

  void result(){

    totalCredits = 0 ;
    totalPoints = 0 ;

    for(int i = 0 ; i < gradeResults.length ; i++){
      switch(gradeResults[i]){

        case ' A+' :
          totalPoints += points['A+']! * double.parse(creditResults[i]) ;
          break ;

        case 'A' :
          totalPoints += points['A']! * double.parse(creditResults[i]) ;
          break ;

        case ' A-' :
          totalPoints += points['A-']! * double.parse(creditResults[i]) ;
          break ;

        case ' B+' :
          totalPoints += points['B+']! * double.parse(creditResults[i]) ;
          break ;

        case 'B' :
          totalPoints += points['B']! * double.parse(creditResults[i]) ;
          break ;

        case ' B-' :
          totalPoints += points['B-']! * double.parse(creditResults[i]) ;
          break ;

        case ' C+' :
          totalPoints += points['C+']! * double.parse(creditResults[i]) ;
          break ;

        case 'C' :
          totalPoints += points['C']! * double.parse(creditResults[i]) ;
          break ;

        case ' C-' :
          totalPoints += points['C-']! * double.parse(creditResults[i]) ;
          break ;

        case ' D+' :
          totalPoints += points['D+']! * double.parse(creditResults[i]) ;
          break ;

        case 'D' :
          totalPoints += points['D']! * double.parse(creditResults[i]) ;
          break ;

        case ' D-' :
          totalPoints += points['D-']! * double.parse(creditResults[i]) ;
          break ;

        case 'F' :
          totalPoints += points['F']! * double.parse(creditResults[i]) ;
          break ;

      }

      totalCredits += double.parse(creditResults[i]) ;

    }

    gpaResult = totalPoints / totalCredits ;
    emit(GpaResultState());
  }

  void resetPoints (){
    points = {
      'A+' : 4 , 'A' : 4 , 'A-' : 3.7 ,
      'B+' : 3.3 , 'B' : 3 , 'B-' : 2.7 ,
      'C+' : 2.3 , 'C' : 2 , 'C-' : 1.7 ,
      'D+' : 1.3 , 'D' : 1 , 'D-' : 0.7 ,
      'F' : 0 ,
    } ;
    setControllers() ;
    CasheHelper.putDate();
    emit(GpaResetPointsState());
  }

  void repeat(context){
    gradeValues = new List.filled(100, 'null', growable: false) ;

    controller = [] ;
    for (int i = 1; i < 100; i++)
      controller.add(TextEditingController());

    coursesNumber = 5 ;
    Navigator.pop(context);

    emit(GpaRepeatState());

  }

  // FocusNode focusNode = FocusNode();
  // String hintText = 'Credit';
  // void hideHintText(){
  //   focusNode.addListener(() {
  //     if (focusNode.hasFocus)
  //       hintText = '';
  //      else
  //       hintText = 'Credit';
  //
  //    } );
  //   emit(hideHintTextState());
  // }
}
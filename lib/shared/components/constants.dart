



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components.dart';

// void signOut(context){
// CasheHelper.removeDate(key: 'token').then((value){
//   // if(value)
// navigateAndFinish(context, ShopLoginScreen());
//   ShopCubit.get(context).currentIndex = 0 ;
//   });
// }

void printFullText(String text){
  final pattern=RegExp('.{1800}');
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}

// calculator constants

// String output = '0' ;
// String num1 = '' ;
// String num2 = '' ;
// String operator = '' ;
// bool isAnswered = false ;

// BMI constants

// bool isMale = true ;
// int height = 170 ;
// int weight = 110 ;
// String result = '' ;
// String resultStatus = '' ;
// String losedWeight = '' ;
// String gainedWeight = '' ;
// Color resultColor = Colors.green ;

//GPA constants

// List<String> grades =[
//   ' A+','A',' A-',
//   ' B+','B',' B-',
//   ' C+','C',' C-',
//   ' D+','D',' D-',
//   'F',
// ];
//
// String selectedItem = '' ;
// int coursesNumber = 5 ;
//
// var gradeValues = new List.filled(100, 'null', growable: false) ;
// List<TextEditingController> controller = [];
// List<TextEditingController> settingController = [];
//
// List<String> gradeResults = [] ;
// List<String> creditResults = [] ;
//
// bool isCalculated = true ;
// double totalPoints = 0;
// double totalCredits = 0;
// double gpaResult = 0 ;
//
Map <String , dynamic> points = {
  'A+' : 4 , 'A' : 4 , 'A-' : 3.7 ,
  'B+' : 3.3 , 'B' : 3 , 'B-' : 2.7 ,
  'C+' : 2.3 , 'C' : 2 , 'C-' : 1.7 ,
  'D+' : 1.3 , 'D' : 1 , 'D-' : 0.7 ,
  'F' : 0 ,
} ;
//
// bool isLoading = false ;

// var creditValues = new List.filled(100, TextEditingController(), growable: false);

// for (int i = 1; i < 75; i++) _controller.add(TextEditingController());

// List<TextEditingController> credit = [] ;
// var controller = TextEditingController() ;
// var arr = new List.filled(5, null, growable: true);

// void customShape() => Container(
//   width: width,
//   height: height,
//   decoration: ShapeDecoration(
//     color: Colors.white,
//     shape: CustomPathBorder(
//       shape: CustomShape(path: path, bounds: bounds),
//     ),
//   ),
// ),






import 'dart:convert';

import 'package:culculator/bmi_calculator/bmi_cubit/bmi_cubit.dart';
import 'package:culculator/bmi_calculator/bmi_screen/bmi_screen.dart';
import 'package:culculator/calculator_cubit/cubit.dart';
import 'package:culculator/calculator_layout/calculator_layout.dart';
import 'package:culculator/calculator_screen/calculator_screen.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_screen/gpa_screen.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:culculator/shared/network/remote/cashe_helper.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:culculator/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();

  points = json.decode(CasheHelper.getDate());

  runApp( MyApp(points));
  // runApp( MyApp( ));
}

class MyApp extends StatelessWidget {
  //
  final Map<String,dynamic> points ;
  MyApp(this.points);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(create: (context) => CalculatorCubit() ),
          BlocProvider(create: (context) => BmiCubit() ),
          BlocProvider(create: (context) => GpaCubit()..setControllers() ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: calculatorColor.withOpacity(0.6),
          appBarTheme: AppBarTheme(
            color: calculatorColor.withOpacity(0.0),
            titleTextStyle: (
            TextStyle(
              color: Colors.white,
              fontSize: 20
            )
            ),
            elevation: 0,
          ),
          primaryColor: Colors.white,
          sliderTheme: SliderThemeData(
            overlayColor: Colors.white,
            activeTickMarkColor: Colors.white,
            thumbColor: Colors.white,
          ),
          primarySwatch:  Colors.cyan,
        ),
        // darkTheme: calculatorLightTheme,
        // themeMode: ThemeMode.dark,
        home: CalculatorLayout() ,
      ),
    );
  }
}

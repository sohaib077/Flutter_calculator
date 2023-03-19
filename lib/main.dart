import 'dart:convert';

import 'package:culculator/bmi_calculator/bmi_cubit/bmi_cubit.dart';
import 'package:culculator/calculator_cubit/cubit.dart';
import 'package:culculator/calculator_layout/calculator_layout.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/onboard_screen/onboard_screen.dart';
import 'package:culculator/shared/bloc_observer.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:culculator/shared/network/remote/cashe_helper.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CasheHelper.init();

  Object? onBoarding = CasheHelper.sharedPreferences!.get('onBoarding');

  if (onBoarding != true) CasheHelper.putDate();
  points = json.decode(CasheHelper.getDate());

  BlocOverrides.runZoned(
    () {
      // Use cubits...
      runApp(MyApp(points, onBoarding));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  //
  final Map<String, dynamic> points;

  final Object? onBoarding;

  MyApp(this.points, this.onBoarding);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CalculatorCubit()),
        BlocProvider(create: (context) => BmiCubit()),
        BlocProvider(create: (context) => GpaCubit()..setControllers()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: calculatorColor.withOpacity(0.4),
          appBarTheme: AppBarTheme(
            color: calculatorColor.withOpacity(0.0),
            titleTextStyle: (TextStyle(
                letterSpacing: 2,
                color: Colors.white.withOpacity(0.88),
                fontSize: 20)),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: defaultColor.withOpacity(0.78),
              statusBarIconBrightness: Brightness.dark,
            ),
          ),
          primaryColor: Colors.white,
          sliderTheme: SliderThemeData(
            overlayColor: Colors.white,
            activeTickMarkColor: Colors.white,
            thumbColor: Colors.white,
            inactiveTickMarkColor: Colors.white,
          ),
          primarySwatch: Colors.cyan,
        ),
        home: onBoarding != true ? OnBoardingScreen() : CalculatorLayout(),
      ),
    );
  }
}

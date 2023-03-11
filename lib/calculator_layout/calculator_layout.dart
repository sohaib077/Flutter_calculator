import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:culculator/calculator_cubit/cubit.dart';
import 'package:culculator/calculator_cubit/states.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CalculatorCubit.get(context);

        return BlocConsumer<GpaCubit, GpaStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: Theme(
                data: Theme.of(context).copyWith(
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                ),
                child: CurvedNavigationBar(
                  index: cubit.currentIndex,
                  items: <Widget>[
                    // Icon(Icons.person_pin_circle_outlined , size: 25,) ,
                    // Icon(new Image.asset('assets/images/bmi icon.png') , size: 25,) ,
                    new Image.asset(
                      'assets/images/bmi icon2.png',
                      scale: 20,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    Icon(
                      Icons.calculate_outlined,
                      size: 25,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    Icon(
                      Icons.school_outlined,
                      size: 25,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ],
                  onTap: (index) {
                    cubit.changeBottomNav(index);
                  },
                  color: calculatorColor.withOpacity(1),
                  backgroundColor: calculatorColor.withOpacity(0.4),
                  buttonBackgroundColor: defaultColor,
                  animationDuration: Duration(milliseconds: 300),
                  height: MediaQuery.of(context).size.height * 0.075,
                ),
              ),
              body: GestureDetector(
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  },
                  child: cubit.screens[cubit.currentIndex]),
            );
          },
        );
      },
    );
  }
}

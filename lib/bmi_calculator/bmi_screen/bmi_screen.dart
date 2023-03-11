
import 'package:culculator/bmi_calculator/bmi_cubit/bmi_cubit.dart';
import 'package:culculator/bmi_calculator/bmi_cubit/bmi_state.dart';
import 'package:culculator/bmi_calculator/result_screen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';

class BmiScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidht = MediaQuery.of(context).size.width ;

    return BlocConsumer<BmiCubit , BmiStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit = BmiCubit.get(context) ;

        return Scaffold(
          // backgroundColor: calculatorColor,
          appBar: AppBar(
            // backgroundColor: calculatorColor,
            elevation: 0,
            titleSpacing: 20,
            title: Text(
              'BMI',
            ),
          ),
          body: (
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(top: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        cubit.changeGender('male') ;
                                      },
                                      // borderRadius: BorderRadius.circular(75),
                                      customBorder: CircleBorder(),
                                      child: Image(
                                        // height: 150,
                                        // width: 150,
                                        height: screenHeight*0.19,
                                        width: screenWidht*0.37,
                                        image: AssetImage(
                                          'assets/images/male.png',
                                        ),
                                        color:  cubit.isMale  ?  Colors.white.withOpacity(1) : Colors.white.withOpacity(0.2),
                                        colorBlendMode: BlendMode.modulate,
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.88),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        cubit.changeGender('female') ;
                                      },
                                      // borderRadius: BorderRadius.circular(75),
                                      customBorder: CircleBorder(),
                                      child: Image(
                                        // height: 150,
                                        // width: 150,
                                        height: screenHeight*0.19,
                                        width: screenWidht*0.37,
                                        image: AssetImage(
                                          'assets/images/female.png',
                                        ),
                                        color:  !cubit.isMale  ?  Colors.white.withOpacity(1) : Colors.white.withOpacity(0.2),
                                        colorBlendMode: BlendMode.modulate,
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white.withOpacity(0.88),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 50,),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal : 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 0.0),
                                      child: Text(
                                        'HEIGHT :',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.88),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic ,
                                      children: [
                                        Text(
                                          '${cubit.height}',
                                          style: TextStyle(
                                            // fontSize: 35,
                                            fontSize: screenWidht*0.09,
                                            fontWeight: FontWeight.w800,
                                            color: defaultColor,
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          'cm',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.88),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(.height: 5,),
                                Slider(
                                  min: 70,
                                  max: 270,
                                  value: cubit.height.toDouble(),
                                  // interval: 40,
                                  // showTicks: true,
                                  // showLabels: true,
                                  inactiveColor: Colors.white12.withOpacity(0.1),
                                  // stepSize: 1,
                                  // enableTooltip: true,
                                  // minorTicksPerInterval: 1,
                                  activeColor: defaultColor,
                                  onChanged: (dynamic value){
                                    cubit.changeHeight(value.round()) ;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        // SizedBox(height: 50,),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal : 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(start: 0.0),
                                      child: Text(
                                        'WEIGHT :',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white.withOpacity(0.88),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic ,
                                      children: [
                                        Text(
                                          '${cubit.weight}',
                                          style: TextStyle(
                                            // fontSize: 35,
                                            fontSize: screenWidht*0.09,
                                            fontWeight: FontWeight.w800,
                                            color: defaultColor,
                                          ),
                                        ),
                                        SizedBox(width: 5,),
                                        Text(
                                          'kg',
                                          style: TextStyle(
                                            color: Colors.white.withOpacity(0.88),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // SizedBox(height: 5,),
                                // SfSlider(
                                //   min: 40,
                                //   max: 180,
                                //   value: cubit.weight,
                                //   // interval: 40,
                                //   // showTicks: true,
                                //   // showLabels: true,
                                //   // enableTooltip: true,
                                //   minorTicksPerInterval: 1,
                                //   activeColor: defaultColor,
                                //   inactiveColor: Colors.white12.withOpacity(0.1),
                                //   stepSize: 1,
                                //   onChanged: (dynamic value){
                                //     cubit.changeWeight(value.round()) ;
                                //   },
                                // ),
                                Slider(
                                  min: 40,
                                  max: 180,
                                  value: cubit.weight.toDouble(),
                                  // interval: 40,
                                  // showTicks: true,
                                  // showLabels: true,
                                  // enableTooltip: true,
                                  activeColor: defaultColor,
                                  inactiveColor: Colors.white12.withOpacity(0.1),
                                  onChanged: (dynamic value){
                                    cubit.changeWeight(value.round()) ;
                                  },
                                ),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  InkWell(
                    onTap: (){
                      cubit.calculateResult();
                      cubit.calculateResultStatus();
                      // navigateTo(context , ResultScreen());
                      navigateTo(context , ResultScreen());
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => ResultScreen()
                      //     ),
                      //   );
                    },
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsetsDirectional.only(
                        top: 15,
                        start: 30,
                        end: 30,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: defaultColor.withOpacity(0.8),
                        borderRadius: BorderRadiusDirectional.only(
                          topStart: Radius.circular(20),
                          topEnd: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        'CALCULATE',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.88),
                          // fontSize: 20,
                          fontSize: screenHeight*0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                ],
              )
          ),
        ) ;
      },
    );
  }
}

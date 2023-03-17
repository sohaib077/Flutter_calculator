import 'package:culculator/bmi_calculator/bmi_cubit/bmi_cubit.dart';
import 'package:culculator/bmi_calculator/bmi_cubit/bmi_state.dart';
import 'package:culculator/shared/components/components.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/constants.dart';

class ResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidht = MediaQuery.of(context).size.width ;

    return BlocConsumer<BmiCubit ,BmiStates>(
      listener: (context, state){},
      builder: (context, state){

        var cubit = BmiCubit.get(context) ;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                cubit.losedWeight = '';
                cubit.gainedWeight = '';
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Your',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: defaultColor,
                      ),
                    ),
                    Text(
                      ' Summary',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: screenWidht,
                        height: screenHeight*0.4,
                        decoration: BoxDecoration(
                          color: calculatorColor.withOpacity(1),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff93DEFF).withOpacity(0.5),
                              offset: Offset(-1, 2),
                              blurRadius: 2,
                            ),
                            BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(1, -1),
                              blurRadius: 1,
                            ),

                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  'Your BMI is ',
                                  style: TextStyle(
                                    height: 2,
                                    fontSize:30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${cubit.result}',
                                  style: TextStyle(
                                    // fontSize:40,
                                    fontSize:screenWidht*0.13,
                                    color: cubit.resultColor,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text(
                                  'kg/m²',
                                  style: TextStyle(
                                    fontSize:20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Your weight is ',
                                      style: TextStyle(
                                        // fontSize:20,
                                        fontSize:screenWidht*0.048,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenWidht*0.35,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          '${cubit.resultStatus}',
                                          style: TextStyle(
                                              // fontSize:30,
                                              fontSize:screenWidht*0.08,
                                              color: cubit.resultColor,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cubit.resultStatus != 'Normal' ?

                              cubit.losedWeight != '' ?
                               Expanded(
                                 child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic ,
                              children: [
                                  Text(
                                    'You need to lose about  ' ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    '${cubit.losedWeight}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: defaultColor ,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      ' kg' ,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                               ) :

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic ,
                                children: [
                                  Text(
                                    'You need to gain about  ' ,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    '${cubit.gainedWeight}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: defaultColor ,
                                    ),
                                  ),
                                  Text(
                                    ' kg' ,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ) :

                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic ,
                                    children: [
                                      Text(
                                        'Your weight is ' ,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18
                                        ),
                                      ),
                                      Text(
                                        'perfect',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: defaultColor ,
                                        ),
                                      ),
                                    ],
                                  ),
                                ) ,
                            Expanded(
                              flex: 4,
                              child: InkWell(
                                onTap: (){
                                  cubit.repeat(context) ;
                                },
                                customBorder: CircleBorder(),
                                child: CircleAvatar(
                                  // radius: 30,
                                  radius: screenWidht*0.09,
                                  backgroundColor: defaultColor.withOpacity(0.8),
                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.white,
                                    size: screenWidht*0.12,
                                  ),
                                ),
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
        ) ;
      },
    );
  }
  
}

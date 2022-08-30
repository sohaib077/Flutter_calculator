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
    return BlocConsumer<BmiCubit ,BmiStates>(
      listener: (context, state){},
      builder: (context, state){

        var cubit = BmiCubit.get(context) ;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){
                losedWeight = '';
                gainedWeight = '';
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
                SizedBox(height: 50,),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Colors.white10.withOpacity(0.1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0,2),
                              color: Colors.white.withOpacity(0.8),
                              blurRadius: 3,
                            ),
                            BoxShadow(
                              offset: Offset(2,0),
                              color: Colors.black,
                              blurRadius: 3,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'Your BMI is ',
                                  style: TextStyle(
                                    fontSize:30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${result}',
                                  style: TextStyle(
                                    fontSize:40,
                                    color: resultColor,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Expanded(
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
                                        fontSize:20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                    ),
                                    Text(
                                      '${resultStatus}',
                                      style: TextStyle(
                                          fontSize:28,
                                          color: resultColor,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            resultStatus != 'Normal' ?

                              losedWeight != '' ?
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
                                    '${losedWeight}',
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
                                    'You need to gain about  ' ,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                    ),
                                  ),
                                  Text(
                                    '${gainedWeight}',
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
                                      // Text(
                                      //   ' kg' ,
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 18,
                                      //   ),
                                      // ),
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
                                  radius: 30,
                                  backgroundColor: defaultColor.withOpacity(0.8),
                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.white,
                                    size: 40,
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

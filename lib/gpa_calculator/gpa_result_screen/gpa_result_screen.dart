import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';

class GpaResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GpaCubit , GpaStates>(
      listener: (context , state){},
      builder: (context , state){
        return Scaffold(
          appBar: AppBar(
            leading: backArrow(context),
          ),
          body:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: AssetImage(
                      'assets/images/hat.png',
                    ),
                    fit: BoxFit.cover,
                  ) ,
                  decoration: BoxDecoration(
                  ),
                  height: 150,
                  width: 150,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     Container(
                //       height: 40,
                //       width: 100,
                //       decoration: BoxDecoration(
                //         // color: defaultColor ,
                //         border: Border.all(
                //           width: 2,
                //           color: Colors.cyan,
                //         ),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'Course',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 40,
                //       width: 100,
                //       decoration: BoxDecoration(
                //         // color: Colors.cyan ,
                //         border: Border.all(
                //           width: 2,
                //           color: Colors.cyan,
                //         ),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'Grade',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 40,
                //       width: 100,
                //       decoration: BoxDecoration(
                //         // color: Colors.cyan ,
                //         border: Border.all(
                //           width: 2,
                //           color: Colors.cyan,
                //         ),
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       child: Center(
                //         child: Text(
                //           'Credits',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 22,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //     ),
                //
                //   ],
                // ),
                // SizedBox(height: 30,),
                Expanded(
                  flex: 4,
                  child: ListView.separated(
                    shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context ,index) => buildGpaResultItem( context , index),
                      separatorBuilder: (context , index) => SizedBox(height: 5,),
                      itemCount: gradeResults.length,
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(
                       start : MediaQuery.of(context).size.width*0.3,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: 30,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Your GPA',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                  gpaResult.toString().endsWith('.0') ?
                                   '${gpaResult.round().toString()}' :
                                   '${gpaResult.toStringAsFixed(3)}' ,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 90,),
                            InkWell(
                              onTap: (){
                                GpaCubit.get(context).repeat(context);
                              },
                              customBorder: CircleBorder(),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.cyan.withOpacity(0.8),
                                child: Icon(
                                  Icons.replay,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildGpaResultItem(context , index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 100,
        height: 50,
        child: Center(
          child: Text(
            'Course ${index+1} :',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),

      Container(
        width: 100,
        height: 50,
        child: GestureDetector(

          onTap: (){
          },
          child:

          Center(
            child: Text(
              gradeResults[index] ,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ) ,
        ),
      ),
      Container(
        width: 100,
        height: 50,
        child: Center(
          child:Text(
            creditResults[index] ,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),


    ],
  ) ;
}

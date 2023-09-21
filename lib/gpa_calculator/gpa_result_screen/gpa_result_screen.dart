import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:culculator/shared/network/remote/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/helpers/show_scroll_picker.dart';

import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/styles/colors.dart';

class GpaResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height ;
    var screenWidht = MediaQuery.of(context).size.width ;

    return BlocConsumer<GpaCubit , GpaStates>(
      listener: (context , state){},
      builder: (context , state){
        var cubit = GpaCubit.get(context);

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
                    height: MediaQuery.of(context).size.height*0.18,
                    width: MediaQuery.of(context).size.width*0.5,
                  ) ,

                ),
                SizedBox(height: 15,),
                Container(
                  height: MediaQuery.of(context).size.height*0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: calculatorColor.withOpacity(1),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff93DEFF).withOpacity(0.4),
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
                  child: ListView.separated(
                    shrinkWrap: false,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context ,index) => buildGpaResultItem( context , index),
                      separatorBuilder: (context , index) => SizedBox(height: 0,),
                      itemCount: cubit.gradeResults.length,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(
                       // start : MediaQuery.of(context).size.width*0.3,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: 0,
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Your GPA',
                                style: TextStyle(
                                  // fontSize: 30,
                                  fontSize: screenHeight*0.045,
                                  color: Colors.white.withOpacity(0.88),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text(
                                  cubit.gpaResult.toString().endsWith('.0') ?
                                   '${cubit.gpaResult.round().toString()}' :

                                  // cubit.gpaResult.toString().endsWith('00') ?
                                  //  '${cubit.gpaResult.toStringAsFixed(1)}' :
                                  //
                                  // cubit.gpaResult.toString().endsWith('0') ?
                                  //   '${cubit.gpaResult.toStringAsFixed(2)}' :

                                   '${cubit.gpaResult.toStringAsFixed(3)}' ,

                                style: TextStyle(
                                  // fontSize: 30,
                                  fontSize: screenHeight*0.05,
                                  color: Colors.cyan,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              end: 10.0,
                            bottom: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 0,),
                              InkWell(
                                onTap: (){
                                  // CasheHelper.saveData(key: 'onBoarding', value: false);
                                  GpaCubit.get(context).repeat(context);
                                },
                                customBorder: CircleBorder(),
                                child: CircleAvatar(
                                  // radius: 30,
                                  radius: screenWidht*0.075,
                                  backgroundColor: Colors.cyan.withOpacity(0.85),
                                  child: Icon(
                                    Icons.replay,
                                    color: Colors.white.withOpacity(0.88),
                                    // size: 35,
                                    size: screenWidht*0.095,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      Flexible(
        fit: FlexFit.tight,
        child: Container(
          width: 100,
          height: 50,
          child: Center(
            child: Text(
              'Course ${index+1} :',
              style: TextStyle(
                color: Colors.white.withOpacity(0.88),
                fontSize: MediaQuery.of(context).size.height*0.025,
              ),
            ),
          ),
        ),
      ),

      Flexible(
        fit: FlexFit.tight,
        child: Container(
          width: 100,
          height: 50,
          child: GestureDetector(

            onTap: (){
            },
            child:

            Center(
              child: Text(
                GpaCubit.get(context).gradeResults[index] ,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.cyan,
                  // fontSize: 22,
                  fontSize: MediaQuery.of(context).size.height*0.033,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ) ,
          ),
        ),
      ),
      Flexible(
        fit: FlexFit.tight,
        child: Container(
          width: 100,
          height: 50,
          child: Center(
            child:Text(
              GpaCubit.get(context).creditResults[index] ,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.cyan,
                // fontSize: 22,
                fontSize: MediaQuery.of(context).size.height*0.033,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),


    ],
  ) ;
}

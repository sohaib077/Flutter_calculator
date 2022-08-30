import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:culculator/gpa_calculator/setting_screen/setting_screen.dart';
import 'package:culculator/shared/components/components.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:culculator/shared/styles/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';

class GpaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GPA',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: (){
                navigateTo(context, SettingScreen());
              },
              icon: Icon(
                IconBroken.Setting,
                size: 26,
                color: Colors.white,
              ),
          ),
          SizedBox(width: 10,)
        ],
      ),
      body:BlocConsumer<GpaCubit ,GpaStates>(
        listener: (context , state){},
        builder: (context , state){

          var cubit = GpaCubit.get(context);

          return Padding(
            padding: const EdgeInsetsDirectional.only(
               top: 10.0 ,
              start: 10 ,
              end: 10 ,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          // color: defaultColor ,
                          border: Border.all(
                            width: 2,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Course',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          // color: Colors.cyan ,
                          border: Border.all(
                            width: 2,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Grade',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          // color: Colors.cyan ,
                          border: Border.all(
                            width: 2,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Credits',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                  flex: 3,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context , index) =>buildGpaItem(context , index) ,
                    separatorBuilder: (context , index) => myDivider() ,
                    itemCount: coursesNumber,
                  ),
                ),
                SizedBox(height: 20,),
                // SizedBox(height: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    cubit.changeCoursesNumber('add' , coursesNumber-1) ;
                                  },
                                  icon: Icon(
                                    IconBroken.Plus,
                                    color: Colors.cyan,
                                    size: 28,
                                  ) ,
                                ),
                                Text(
                                  'Add ',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: (){
                                    cubit.changeCoursesNumber('delete' , coursesNumber-1) ;
                                  },
                                  icon: Icon(
                                    IconBroken.Delete,
                                    color: Colors.cyan,
                                    size: 28,
                                  ) ,
                                ),
                                Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 100,),
                InkWell(
                  onTap: (){
                    cubit.fillResult(context);
                    cubit.result();
                    // print(gradeResults);
                    // print(creditResults);
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
                      color: Colors.cyan.withOpacity(0.8),
                      borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(20),
                        topEnd: Radius.circular(20),
                      ),
                    ),
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ) ;
        },
      ) ,
    );
  }

  Widget buildGpaItem(context , index) => Row(
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
            showMaterialScrollPicker(
                context: context,
                items: grades,
                selectedItem: gradeValues[index],
                title: 'Pick your grade' ,
                headerTextColor: Colors.white,
                backgroundColor:  calculatorColor  ,
                headerColor: Colors.cyan.withOpacity(0.5),
                buttonTextColor: Colors.white,
                showDivider: false,

                onChanged: (value){
                 GpaCubit.get(context).changeGradeValue(value, index) ;
                }
            );
          },
          child:
          gradeValues[index] == 'null' ?
          Center(
            child: Text(
              'Grade' ,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ) :
          Center(
            child: Text(
              gradeValues[index] ,
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
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: controller[index] ,
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 22,
              // fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Credit' ,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                )

            ),
          ),
        ),
      ),


    ],
  ) ;
}

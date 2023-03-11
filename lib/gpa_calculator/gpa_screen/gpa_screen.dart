import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
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

import '../gpa_result_screen/gpa_result_screen.dart';

class GpaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidht = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'GPA',
        //   style: TextStyle(
        //     color: Colors.white.withOpacity(0.88),
        //   ),
        // ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SettingScreen(), x: 0.0, y: -1.0);
            },
            icon: Icon(
              IconBroken.Setting,
              size: 26,
              color: Colors.white.withOpacity(0.88),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: BlocConsumer<GpaCubit, GpaStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = GpaCubit.get(context);

          return Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 10.0,
              start: 10,
              end: 10,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        // height: 40,
                        // width: 100,
                        height: screenHeight * 0.06,
                        width: screenWidht * 0.25,
                        decoration: BoxDecoration(
                          // color: defaultColor ,
                          border: Border.all(
                            width: 2,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Course',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.88),
                              // fontSize: 22,
                              fontSize: screenWidht * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          // height: 40,
                          // width: 100,
                          height: screenHeight * 0.06,
                          width: screenWidht * 0.25,
                          decoration: BoxDecoration(
                            // color: Colors.cyan ,
                            border: Border.all(
                              width: 2,
                              color: Colors.cyan,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Grade',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.88),
                                // fontSize: 22,
                                fontSize: screenWidht * 0.055,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // height: 40,
                        // width: 100,
                        height: screenHeight * 0.06,
                        width: screenWidht * 0.25,
                        decoration: BoxDecoration(
                          // color: Colors.cyan ,
                          border: Border.all(
                            width: 2,
                            color: Colors.cyan,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Credits',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.88),
                              // fontSize: 22,
                              fontSize: screenWidht * 0.055,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 3,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildGpaItem(context, index),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: cubit.coursesNumber,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // SizedBox(height: 20,),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cubit.changeCoursesNumber(
                                        'add', cubit.coursesNumber - 1);
                                  },
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    IconBroken.Plus,
                                    color: Colors.cyan,
                                    // size: 28,
                                    size: screenHeight * 0.05,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Add ',
                                  style: TextStyle(
                                    height: 2,
                                    color: Colors.white.withOpacity(0.88),
                                    fontSize: screenHeight * 0.025,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cubit.changeCoursesNumber(
                                        'delete', cubit.coursesNumber - 1);
                                  },
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    IconBroken.Delete,
                                    color: Colors.cyan,
                                    // size: 28,
                                    size: screenHeight * 0.05,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Text(
                                    'Delete',
                                    style: TextStyle(
                                      height: 2,
                                      color: Colors.white.withOpacity(0.88),
                                      fontSize: screenHeight * 0.025,
                                    ),
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
                  onTap: () {
                    cubit.fillResult().then((value) {
                      if (value) navigateTo(context, GpaResultScreen());
                      cubit.result();
                    });
                    // cubit.fillResult(context);
                    // cubit.result();
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
                    child: state is! GpaResultLoadingState
                        ? Text(
                            'CALCULATE',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.88),
                              // fontSize: 20,
                              fontSize: screenHeight * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildGpaItem(context, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: 100,
              height: 50,
              child: Center(
                child: Text(
                  'Course ${index + 1} :',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.88),
                    // fontSize: 18,
                    fontSize: MediaQuery.of(context).size.height * 0.025,
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
                onTap: () {
                  showMaterialScrollPicker(
                    context: context,
                    items: GpaCubit.get(context).grades,
                    selectedItem: GpaCubit.get(context).gradeValues[index],
                    title: 'Pick your grade',
                    headerTextColor: Colors.white.withOpacity(0.88),
                    backgroundColor: calculatorColor,
                    // backgroundColor:  Colors.teal,
                    headerColor: Colors.cyan.withOpacity(0.7),
                    buttonTextColor: Colors.white.withOpacity(0.88),
                    showDivider: false,

                    onChanged: (value) {
                      GpaCubit.get(context).changeGradeValue(value, index);
                    },
                  );
                },
                child: GpaCubit.get(context).gradeValues[index] == 'null'
                    ? Center(
                        child: Text(
                          'Grade',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            // fontSize: 20,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.025,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          GpaCubit.get(context).gradeValues[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.cyan,
                            // fontSize: 22,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.033,
                            fontWeight: FontWeight.w500,
                          ),
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
              child: Center(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: GpaCubit.get(context).controller[index],
                  style: TextStyle(
                    color: Colors.cyan,
                    // fontSize: 22,
                    fontSize: MediaQuery.of(context).size.height * 0.033,
                    // fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Credit',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      // fontSize: 20,
                      fontSize: MediaQuery.of(context).size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

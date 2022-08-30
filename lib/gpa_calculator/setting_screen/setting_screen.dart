import 'package:culculator/gpa_calculator/gpa_cubit/gpa_cubit.dart';
import 'package:culculator/gpa_calculator/gpa_cubit/gpa_states.dart';
import 'package:culculator/shared/components/components.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:culculator/shared/network/remote/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/styles/icon_broken.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GpaCubit , GpaStates>(
       listener: (context , state){},
       builder: (context , state){
         var cubit = GpaCubit.get(context);
         return Scaffold(
           appBar: AppBar(
             leading: backArrow(context),
             actions: [
               TextButton(
                 onPressed: (){
                   cubit.resetPoints();
                 },
                 child: Text(
                   'Reset',
                 ),
               ),
               SizedBox(width: 15,),
             ],
           ),
           body: Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
               children: [
                 Expanded(
                   child: ListView.separated(
                     physics: BouncingScrollPhysics(),
                     itemBuilder: (context, index) => index != 4 ?  buildSettingItem(index) :  Column(
                       children: [
                         Container(
                           height: 40,
                           width: 40,
                           decoration: BoxDecoration(
                             border: Border.all(
                               width: 1,
                               color: Colors.cyan,
                             ),
                             borderRadius: BorderRadius.circular(8),
                             color: Colors.transparent,
                           ),
                           child: Center(
                             child: Text(
                               points.keys.last,
                               style: TextStyle(
                                 fontSize: 18,
                                 color: Colors.white,
                               ),
                             ),
                           ),
                         ),
                         Container(
                           height: 40,
                           width: 40,
                           child: TextFormField(
                             style: TextStyle(
                               color: Colors.white,
                             ),
                             textAlign: TextAlign.center,
                             controller: settingController[12],
                             keyboardType: TextInputType.number,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'points',

                                 hintStyle: TextStyle(
                                   color: Colors.grey,
                                 )
                             ),
                             onChanged: (_value){
                               points.update(points.keys.last, (value) => double.parse(_value))  ;
                             },
                           ),
                         ),
                         Container(
                           width: 40,
                           height: 1,
                           color: Colors.cyan.withOpacity(0.3),
                         ),
                       ],
                     ),
                     separatorBuilder: (context, index) => index != 4 ? SizedBox(height: 25,) : SizedBox(height: 0,),
                     itemCount: 5,
                   ),
                 ),
                 Padding(
                   padding:  EdgeInsetsDirectional.only(
                     start: MediaQuery.of(context).size.width*0.65 ,
                     bottom: MediaQuery.of(context).size.height*0.01 ,
                   ),
                   child: InkWell(
                     onTap: (){
                       CasheHelper.putDate();
                       Navigator.pop(context) ;
                     },
                     customBorder: CircleBorder(),
                     child: CircleAvatar(
                       radius: 33,
                       backgroundColor: Colors.cyan.withOpacity(0.8),
                       child: Text(
                         'Save',
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.white,
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ) ;
       },
    );
  }

  Widget buildSettingItem(index) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.cyan,
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                points.keys.elementAt(index*3),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              controller: settingController[index*3],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'points',

                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
              ),
               onChanged: (_value){
                             points.update(points.keys.elementAt(index*3), (value) => double.parse(_value))  ;
                            },

            ),
          ),
          Container(
            width: 40,
            height: 1,
            color: Colors.cyan.withOpacity(0.3),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.cyan,
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                points.keys.elementAt((index*3)+1),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              controller: settingController[index*3+1],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'points',

                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
               onChanged: (_value){
                             points.update(points.keys.elementAt(index*3+1), (value) => double.parse(_value))  ;
                            },
            ),
          ),
          Container(
            width: 40,
            height: 1,
            color: Colors.cyan.withOpacity(0.3),
          ),
        ],
      ),
      Column(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Colors.cyan,
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
            ),
            child: Center(
              child: Text(
                points.keys.elementAt((index*3)+2),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            height: 40,
            width: 40,
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              controller: settingController[index*3+2],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'points',

                  hintStyle: TextStyle(
                    color: Colors.grey,
                  )
              ),
               onChanged: (_value){
                             points.update(points.keys.elementAt(index*3+2), (value) => double.parse(_value))  ;
                            },
            ),
          ),
          Container(
            width: 40,
            height: 1,
            color: Colors.cyan.withOpacity(0.3),
          ),
        ],
      ),

    ],
  ) ;
}

import 'package:culculator/calculator_cubit/cubit.dart';
import 'package:culculator/calculator_cubit/states.dart';
import 'package:culculator/calculator_layout/calculator_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../shared/styles/colors.dart';
import '../shared/components/components.dart';
import '../shared/network/remote/cashe_helper.dart';
import '../shared/styles/icon_broken.dart';

class BoardingModel
{
  // late final ImageProvider image;
  late final String image;
  late final String title;
  late final String body;

  BoardingModel(
      this.image,
      this.title,
      this.body,
      );
}

class OnBoardingScreen extends StatelessWidget {


  List <BoardingModel> boarding =[
    BoardingModel(
         // AssetImage('assets/images/bmi.png') ,
         'assets/images/bmi.png' ,
         'BMI Calculator',
         'Use this calculator to check your body mass index (BMI) \nand find out if you\'re a healthy , under or over weight .'
    ),
    BoardingModel(
        // AssetImage('assets/images/calculator.png') ,
        'assets/images/calculator.png' ,
        'Calculator',
      'Use this simple calculator to performe mathematical \ncalculations, such as addition, multiplication,  \nsubtraction, or division.'
    ),
    BoardingModel(
        // AssetImage('assets/images/gpa.png') ,
      'assets/images/gpa.png',
      'GPA Calculator',
      'Use this calculator to calculate grade point average (GPA) . \nIf you use percentage grades, have grades on a different scale or in high school with AP/IB classes, \nplease change the "Settings" to input specific values.'
    ),
  ];

  var boardController = PageController();

  // bool isLast = false;
  //
  // void submit(){
  //   CasheHelper.saveData(
  //       key: 'onBoarding',
  //       value: true,
  //   ).then((value) {
  //     if(value){
  //       navigateAndFinish(context, CalculatorLayout());
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit ,CalculatorStates>(
      listener: (context ,state){},
      builder: (context ,state){

        var cubit = CalculatorCubit.get(context);

        return Scaffold(
          backgroundColor: calculatorColor.withOpacity(0.75),
          appBar: AppBar(
            actions: [
              TextButton(
                // onPressed: (){
                //   navigateAndFinish(context, CalculatorLayout());
                // },
                onPressed: (){
                  cubit.submit(context) ;
                } ,
                child: Text(
                  'SKIP',
                ),
              ),
            ],
          ),
          body:  Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 30 ,
              end: 30,
              bottom: 20,
            ),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boardController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context , index) => buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,

                    onPageChanged: (int index){
                      // if(index == boarding.length-1){
                      //   setState(() {
                      //     isLast = true;
                      //   });
                      // }
                      // else {
                      //   setState(() {
                      //     isLast = false;
                      //   });
                      // }
                      cubit.pageChanged(index, boarding.length-1) ;
                    },
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        spacing: 5,
                        dotColor: Colors.white.withOpacity(0.9),
                        activeDotColor: defaultColor,
                      ),

                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: (){

                        if(cubit.isLast){
                          // navigateAndFinish(context, CalculatorLayout());
                          cubit.submit(context);
                        }
                        else{
                          boardController.nextPage(
                          duration: Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn ,
                        );
                        }
                      },
                      child: Icon(
                       IconBroken.Arrow___Right_2,
                        color: Colors.white.withOpacity(0.9),
                        size: MediaQuery.of(context).size.height*.05,
                      ),

                    ),
                  ],
                ),
              ],
            ),
          ),
        ) ;
      },
    );
  }


  Widget buildBoardingItem(BoardingModel boarding) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Container(
          child: Image(
            // image:  boarding.image ,
            image:  AssetImage(
                boarding.image ,
            ) ,
          ),
        ),
      ),
      SizedBox(height: 10,),
      Text(
        '${boarding.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
      SizedBox(height: 20),
      Text(
        '${boarding.body}',
        style: TextStyle(
          color: Colors.white.withOpacity(0.9),
          height: 1.5,
        ),
      ),
      SizedBox(height: 30),
    ],
  );
}

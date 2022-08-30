import 'package:culculator/calculator_cubit/cubit.dart';
import 'package:culculator/calculator_cubit/states.dart';
import 'package:culculator/shared/components/constants.dart';
import 'package:culculator/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/styles/icon_broken.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit , CalculatorStates>(
      listener: (context , state) {},
      builder: (context, state) {

        var cubit = CalculatorCubit.get(context) ;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: calculatorColor,
            elevation: 0,
            titleSpacing: 20,
            title: Text(
              'Calculator',
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: calculatorColor ,
                  height: MediaQuery.of(context).size.height*0.17,
                  width: double.infinity,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          bottom: 40,
                          end: 40
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if(isAnswered == true)
                            Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                child: Text(
                                  num1 + num2 ,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.5,),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              child: Container(
                                child: Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Text(
                                    output,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 35,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height: MediaQuery.of(context).size.height*0.2,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: calculatorColor ,
                      // color: Colors.grey ,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0 , 5) ,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calculatorBuildItem(
                                    text: 'AC',
                                    textColor: Colors.grey,
                                  function: (){
                                      cubit.clear();
                                  }
                                ),
                                calculatorBuildItem(
                                  text: 'del',
                                  textColor: Colors.grey,
                                  function: (){
                                    cubit.delete();
                                  }
                                ),
                                calculatorBuildItem(
                                    text: '%',
                                    textColor: Colors.grey,
                                  function: (){
                                      cubit.operations('%');
                                  }
                                ),
                                calculatorBuildItem(
                                    text: '÷',
                                    textColor: Colors.grey,
                                    function: (){
                                      cubit.operations('÷') ;
                                    }
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calculatorBuildItem(
                                  text: '7',
                                  function: (){
                                    cubit.typeNumbers('7');
                                  }
                                ),
                                calculatorBuildItem(
                                  text: '8',
                                    function: (){
                                      cubit.typeNumbers('8');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '9',
                                    function: (){
                                      cubit.typeNumbers('9');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '×',
                                    function: (){
                                      cubit.operations('×') ;
                                    }
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calculatorBuildItem(
                                  text: '4',
                                    function: (){
                                      cubit.typeNumbers('4');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '5',
                                    function: (){
                                      cubit.typeNumbers('5');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '6',
                                    function: (){
                                      cubit.typeNumbers('6');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '-',
                                    function: (){
                                      cubit.operations('-') ;
                                    }
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calculatorBuildItem(
                                  text: '1',
                                    function: (){
                                      cubit.typeNumbers('1');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '2',
                                    function: (){
                                      cubit.typeNumbers('2');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '3',
                                    function: (){
                                      cubit.typeNumbers('3');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '+',
                                  function: (){
                                    cubit.operations('+') ;
                                  }

                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                calculatorBuildItem(
                                    text: '+/-',
                                    textColor: Colors.grey,
                                    function: (){
                                      cubit.changeSign();
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '0',
                                  function: (){
                                    cubit.typeNumbers('0');
                                  }
                                ),
                                calculatorBuildItem(
                                  text: '.',
                                  function: (){
                                      cubit.typeNumbers('.');
                                    }
                                ),
                                calculatorBuildItem(
                                  text: '=',
                                  color: defaultColor,
                                  function: (){
                                    cubit.answer();
                                  }
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ) ,

              ],
            ),
          ),
        ) ;
      },
    );
  }

}

Widget  calculatorBuildItem ({
  String text = '1' ,
  Color textColor =Colors.white ,
  Color color = calculatorColor ,
  Function ? function ,
}) => InkWell(
  onTap: () => function!(),
  borderRadius:BorderRadius.all(Radius.circular(10)) ,
  // highlightColor: Colors.white,
  child: Container(
    height: 60,
    width: 60,
    decoration: BoxDecoration(
      color: color.withOpacity(0.85),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(-1,-1),
            blurRadius: 3
        ),
        BoxShadow(
          color: Colors.black,
          offset: Offset(3,3),
          blurRadius: 3,
        ),
      ],
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 30,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
  ),
) ;


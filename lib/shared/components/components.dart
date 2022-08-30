import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../styles/colors.dart';
import '../styles/icon_broken.dart';

Widget defultButton({
  double width : double.infinity,
  Color background : defaultColor,
  double radius : 15,
  bool isUpper : true,
  Color textColor : Colors.white,
   required Function function ,
  required String text ,
}) => Container(

  height: 40,
  width: width,
  child: MaterialButton(
    onPressed: () => function(),
    child: Text(
      isUpper ? text.toUpperCase() : text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
    ),
  ),
  decoration: BoxDecoration(
    color: background,
    borderRadius: BorderRadius.circular(radius),
  ),
);

Widget defultTextField({

  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  required Function validate,
  Function? onSubmit,
  Function? onChange,
  Function? onTape,
  bool isPassword : false,
  Function? suffixPress,
  bool readOnly = false ,
  // Color labelColor : defaultColor,
  // Color prefixIconColor : defaultColor,
  // Color borderSideColor : defaultColor,
  // Color cursorColor : defaultColor,


}) => TextFormField(
  // onTap: ()=> onTape!(),
  readOnly: readOnly ,
  obscureText: isPassword,
  controller: controller ,
  cursorColor: defaultColor,
  keyboardType: type,
  decoration: InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.grey,
      ),
    ),
    focusedBorder:  OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: defaultColor,
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    labelText: label,
    floatingLabelStyle: TextStyle(
      // color: defaultColor,
    ),
    labelStyle: TextStyle(
      // color: labelColor,
    ),

    prefixIcon: Icon(
      prefix,
      // color: prefixIconColor,
    ),

    suffixIcon: suffix != null ? IconButton (
      onPressed: () => suffixPress!() ,
      icon : Icon(
        suffix,
      ),
      // color: defaultColor,
    ) : null,
  ),
  onFieldSubmitted: (value) => onSubmit!(value) != null ? onSubmit : null ,
  // onChanged: (value) => onChange!(value) ,
  validator: (value) => validate(value),
);



Widget defaultTextButton({
  required Function ? function,
  required String text,
}) => TextButton(
    onPressed: () => function!(),
    child: Text(
      text.toUpperCase() ,
    ),
  );





Widget CalculatorButton({

  required Color color ,
  required String text,
  Color text_color : Colors.white,
  required Function function,

}) => Padding(
  padding: const EdgeInsets.only(bottom: 12.0),
  child:   RaisedButton(
    onPressed: () => function(),
    shape: CircleBorder() ,
    color: color,
    padding: EdgeInsets.all(15),
    child: Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 40,
        color: text_color,
      ),
    ),
  ),
);


Widget myDivider({
  Color color = Colors.grey,
}) => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20,
  ),
  child: Container(
    padding: EdgeInsetsDirectional.all(20),
    width: double.infinity,
    height: 1,
    color: color.withOpacity(0.2),

  ),
);


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
    ),
  );


void navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
    ),
      (route) {
        return false;
      }
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

enum ToastStates{SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color ;

  switch(state){

    case ToastStates.SUCCESS : color = Colors.green ;
    break;
    case ToastStates.ERROR : color = Colors.red ;
    break;
    case ToastStates.WARNING : color = Colors.amber ;
    break;

  }
  return color;
}

Widget backArrow(context , {Color color = Colors.white}) => IconButton(
  onPressed: (){
    Navigator.pop(context);
  },
  icon: Icon(
    Icons.arrow_back_ios,
    color: color,
  ),
);




PreferredSizeWidget  defaultAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
  double titleSpacing = 5 ,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(IconBroken.Arrow___Left_2),
      ),
      titleSpacing: titleSpacing,
      title: Text(title!),
      actions: actions,
    );





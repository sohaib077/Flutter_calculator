import 'dart:convert';

import 'package:culculator/shared/components/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {

static SharedPreferences ? sharedPreferences ;

static init() async
{
  sharedPreferences = await SharedPreferences.getInstance();
  }

 static putDate( ) async
 {

   String encodedMap = json.encode(points);
   print(encodedMap);

   return await sharedPreferences!.setString('cashePoints', encodedMap);
    }


  // String? encodedMap =  CasheHelper.sharedPreferences?.getString('points');
  // Map<String,dynamic> decodedMap = json.decode(encodedMap!);

static dynamic getDate( )
{
  String ? encodedMap =  sharedPreferences?.getString('cashePoints');
  print(encodedMap) ;
  return  encodedMap ;
  // Map<String,dynamic> decodedMap = json.decode(encodedMap);
  // print(decodedMap);
}


 }


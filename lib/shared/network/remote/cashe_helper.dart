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

   return await sharedPreferences!.setString('cashePoints', encodedMap);
    }


static dynamic getDate( )
{
  String ? encodedMap =  sharedPreferences?.getString('cashePoints');
  if(encodedMap == null )
    putDate();
  return  encodedMap ;
}

static Future<bool> saveData( {
  required String key ,
  required bool value,
}) async
{
  return await sharedPreferences!.setBool(key, value);
}


 }


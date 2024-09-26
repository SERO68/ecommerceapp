import 'package:shared_preferences/shared_preferences.dart';

import 'enums.dart';

class shared{
  static  SharedPreferences? prefs;
  static init() async {
    prefs = await SharedPreferences.getInstance();
  }
 static setBool( {required Sharedkeys key,required bool value}) async {
    prefs?.setBool(key.name, value);
  }
 static getBool( { required Sharedkeys key}) {
    return prefs?.getBool(key.name)??false;
  }
  static setstring( {required  Sharedkeys key, required String value}){
    prefs?.setString(key.name, value);
  }
 static  getstring( {required Sharedkeys key}){
    return prefs?.getString(key.name)??'';
  }
 static setint( {required Sharedkeys key, required int value}){
    prefs?.setInt(key.name, value);
  }
 static getint({required  Sharedkeys keY}){
    return prefs?.getInt(keY.name)??0;
  }
 static setdouble({required Sharedkeys key, required double value}){

    prefs?.setDouble( key.name, value);
  }
 static getdouble({ required Sharedkeys key}){
    return prefs?.getDouble(key.name)??0.0;
  }
}


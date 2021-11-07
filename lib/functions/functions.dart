import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/database/database_services.dart';

int plus (int a, int b){
  int _result = a+b;
  DateTime _now = DateTime.now();
  String timeStamp =
      'timestamp: ${_now.month}.${_now.day}.${_now.year}, ${_now.hour}:${_now.minute}';
  insert(a.toString(),"+",b.toString(), _result.toString(),timeStamp);
  return _result;

}

int minus (int a, int b){
  int _result = a-b;
  return _result;
  DateTime _now = DateTime.now();
  String timeStamp =
      'timestamp: ${_now.month}.${_now.day}.${_now.year}, ${_now.hour}:${_now.minute}';
  //insert(num1controller.text,"-",num2controller.text, resulttext,timeStamp);

}

int multiply (int a, int b){
  int _result = a*b;
  return _result;
  DateTime _now = DateTime.now();
  String timeStamp =
      'timestamp: ${_now.month}.${_now.day}.${_now.year}, ${_now.hour}:${_now.minute}';
  //insert(num1controller.text,"x",num2controller.text, resulttext,timeStamp);
}

double divide (double a, double b){
  double _result = a/b;
  return _result;
  DateTime _now = DateTime.now();
  String timeStamp =
      'timestamp: ${_now.month}.${_now.day}.${_now.year}, ${_now.hour}:${_now.minute}';
  // insert(num1controller.text,"/",num2controller.text, resulttext,timeStamp);
}

num power (int a, int b){
  num _result= pow(a,b);
  return _result;
  DateTime _now = DateTime.now();
  String timeStamp =
      'timestamp: ${_now.month}.${_now.day}.${_now.year}, ${_now.hour}:${_now.minute}';
  //insert(num1controller.text,"^",num2controller.text, resulttext,timeStamp);
}

double convertUnits(TextEditingController unitController,bool val){
  double res=0;
  if(val==false) {
       double res = (double.parse(unitController.text)*1.609344);
       return res;
    }

  if(val==true){
       double res = (double.parse(unitController.text)*0.621371);
       return res;
    }
  return res;
}
void insert(String a, String b, String c,String d,String e) async{
  int i = await DatabaseHelper.instance.insert(
      {
        DatabaseHelper.columnFirst: a,
        DatabaseHelper.columnOperation: b,
        DatabaseHelper.columnSecond: c,
        DatabaseHelper.columnResult: d,
        DatabaseHelper.columnDate: e,
      }
  );
}


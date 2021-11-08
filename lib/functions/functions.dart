import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app/database/database_services.dart';
import 'package:intl/intl.dart';



String dateFormat(DateTime time){
   String _time = DateFormat.yMMMMd().add_jm().format(time);
   return _time;
}

int plus(int a, int b) {
  int _result = a + b;
  DateTime _now = DateTime.now();
  insert(a.toString(), '+', b.toString(), _result.toString(), dateFormat(_now));
  return _result;
}

int minus(int a, int b) {
  int _result = a - b;
  DateTime _now = DateTime.now();
  insert(a.toString(), '-', b.toString(), _result.toString(), dateFormat(_now));
  return _result;
}

int multiply(int a, int b) {
  int _result = a * b;
  DateTime _now = DateTime.now();
  insert(a.toString(), '*', b.toString(), _result.toString(), dateFormat(_now));
  return _result;
}

double divide(double a, double b) {
  double _result = a / b;
  DateTime _now = DateTime.now();
  insert(a.toString(), '/', b.toString(), _result.toString(), dateFormat(_now));
  return _result;
}

num power(int a, int b) {
  num _result = pow(a, b);
  DateTime _now = DateTime.now();
  insert(a.toString(), '^', b.toString(), _result.toString(), dateFormat(_now));
  return _result;
}

double convertUnits(TextEditingController unitController, bool val) {
  double res = 0;
  if (val == false) {
    double res = (double.parse(unitController.text) * 1.609344);
    return res;
  }

  if (val == true) {
    double res = (double.parse(unitController.text) * 0.621371);
    return res;
  }
  return res;
}

String correction(String a){
  RegExp exp = RegExp(r"[^\w\s+-/:*^=]+");
  String b = a.replaceAll(exp,'');
  b = b.replaceAll(',','');
  return b;
}



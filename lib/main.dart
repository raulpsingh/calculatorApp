import 'package:flutter/material.dart';
import 'package:calculator_app/pages/main_page.dart';
import 'package:calculator_app/database/database_services.dart';


void main() {
  runApp(mainPage());
  initFirebase();
}
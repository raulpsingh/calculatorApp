import 'package:flutter/material.dart';
import 'package:calculator_app/functions/functions.dart';
import 'package:calculator_app/database/database_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData.dark().copyWith(
            brightness: Brightness.dark, accentColor: Colors.deepPurple),
        home: Builder(
          builder: (context) => Scaffold(
            body:  MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10,left: 5),
                  child: getHistory(),
                ))),


          ),
        );
  }
}


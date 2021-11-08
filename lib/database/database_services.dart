import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:calculator_app/functions/functions.dart';



void initFirebase() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void insert(String firstNumber, String func,String secondNumber,String result, String time,{String equals= '='} ){
  List a= [firstNumber,func,secondNumber,equals,result ,time];
  FirebaseFirestore.instance.collection('histories').add({'history': a});
}

class getHistory extends StatefulWidget {
  const getHistory({Key? key}) : super(key: key);

  @override
  _getHistoryState createState() => _getHistoryState();
}

class _getHistoryState extends State<getHistory> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('histories').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if(!snapshot.hasData) return Text("No records");
        return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index){
              return Text(
                correction(correction(snapshot.data.docs[index].get('history').toString())), style: TextStyle(fontFamily: 'Nexa',fontSize: 18),

              );
            }
        );



        /*  return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (BuildContext context, int index){
              return Dismissible(
                key: Key(snapshot.data.docs[index].id),

                child: Text(correction(snapshot.data.docs[index].get('history').toString()), style: TextStyle(fontFamily: 'Nexa',fontSize: 18),),*

              );
            }
        );*/
      },

    );
  }
}





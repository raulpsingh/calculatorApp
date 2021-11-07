import 'package:flutter/material.dart';
import 'package:calculator_app/functions/functions.dart';

class Converter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          brightness: Brightness.dark, accentColor: Colors.deepPurple),
      home: Scaffold(
        body: Convert(),
      ),
    );
  }
}

class Convert extends StatefulWidget {
  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {
  TextEditingController unitController = TextEditingController();
  String result = '0';
  var value = false;
  var unit = "Convert from miles to kilometers";

  void swap() {
    result = "";
    if (value) {
      setState(() {
        unit = "Convert from miles to kilometers";
        value = false;
      });
    } else {
      setState(() {
        unit = "Convert from kilometers to miles";
        value = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(unit,
                      style: const TextStyle(
                          fontSize: 18, color: Colors.grey, fontFamily: 'Nexa')),
                  FlatButton.icon(
                      onPressed: swap,
                      icon: const Icon(Icons.swap_horiz, color: Colors.grey,),
                      label: const Text("Swap", style: TextStyle(color: Colors.grey, fontFamily: 'Nexa'),)),
                ]),
          ),
          SizedBox(
            width: 320,
            child: TextField(
              cursorColor: Colors.deepPurple,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(5))),
              keyboardType: TextInputType.number,
              controller: unitController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 150,
              height: 50,
              child: RaisedButton(
                  child: const Text("Convert", style: TextStyle(fontFamily: 'Nexa'),),
                  color: Colors.black26,
                  splashColor: Colors.deepPurple,
                  onPressed: () {
                    setState(() {
                      double res = convertUnits(unitController, value);
                      result = res.toString();
                      //convertUnit,
                    });
                  }),
            ),
          ),
          Padding(padding:const EdgeInsets.only(top: 10) ,
          child : Text(
          "Result: $result",
          style: const TextStyle(
            fontSize: 30, fontFamily: 'Nexa'
          ),
          ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:calculator_app/functions/functions.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Calculator();
  }
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            brightness: Brightness.dark, accentColor: Colors.deepPurple),
        home: Builder(
          builder: (context) => Scaffold(
            body: AddTwoNumbers(),
          ),
        ));
  }
}

class AddTwoNumbers extends StatefulWidget {
  @override
  _AddTwoNumbersState createState() => _AddTwoNumbersState();
}

class _AddTwoNumbersState extends State<AddTwoNumbers> {
  TextEditingController num1controller = TextEditingController();
  TextEditingController num2controller = TextEditingController();
  String resulttext = "0";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 15,
            ),
            child: Row(
              children: <Widget>[
                const Text("Number 1 : ",
                    style: TextStyle(fontFamily: "Nexa", fontSize: 20)),
                SizedBox(
                  width: 250,
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    controller: num1controller,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Row(
              children: <Widget>[
                const Text("Number 2 : ",
                    style: TextStyle(fontFamily: "Nexa", fontSize: 20)),
                SizedBox(
                  width: 250,
                  child: TextField(
                    cursorColor: Colors.deepPurple,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(5))),
                    keyboardType: TextInputType.number,
                    controller: num2controller,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                //Padding(padding: EdgeInsets.only(: 20)),
                RaisedButton(
                  child: const Text("+"),
                  color: Colors.black26,
                  onPressed: () {
                    setState(
                      () {
                        int _result = plus(int.parse(num1controller.text),
                            int.parse(num2controller.text));
                        resulttext = _result.toString();
                      },
                    );
                  },
                ),
                RaisedButton(
                  child: const Text("-"),
                  color: Colors.black26,
                  onPressed: () {
                    setState(() {
                      int _result = minus(int.parse(num1controller.text),
                          int.parse(num2controller.text));
                      resulttext = _result.toString();
                    });
                  },
                ),
                RaisedButton(
                  child: const Text("x"),
                  color: Colors.black26,
                  onPressed: () {
                    setState(() {
                      int _result = multiply(int.parse(num1controller.text),
                          int.parse(num2controller.text));
                      resulttext = _result.toString();
                    });
                  },
                ),
                RaisedButton(
                  child: const Text("/"),
                  color: Colors.black26,
                  onPressed: () {
                    setState(() {
                      double result = divide(double.parse(num1controller.text),
                          double.parse(num2controller.text));
                      resulttext = result.toStringAsPrecision(3);
                    });
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("^"),
                color: Colors.black26,
                onPressed: () {
                  setState(() {
                    num result = power(int.parse(num1controller.text),
                        int.parse(num2controller.text));
                    resulttext = result.toStringAsPrecision(3);
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Result : ",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  resulttext,
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

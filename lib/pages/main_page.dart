import 'package:flutter/material.dart';
import 'package:calculator_app/pages/calculator.dart';
import 'package:calculator_app/pages/converter.dart';
import 'package:calculator_app/pages/history.dart';


class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _currentidex = 0;
  final tabs = [
    Calculator(),
    Converter(),
    History(),
  ];
  @override
  Widget build(BuildContext context) {
    String appTitle = 'Simple calculator';
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title:
            Text(appTitle, style: const TextStyle(fontFamily: "Nexa", fontSize: 30)),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
      ),
      body: tabs[_currentidex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentidex,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.purpleAccent,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            title: Text('Calculator',style: TextStyle(fontFamily: "Nexa")),
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: Text('Converter',style: TextStyle(fontFamily: "Nexa")),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History',style: TextStyle(fontFamily: "Nexa")),
            backgroundColor: Colors.deepPurple,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentidex = index;
          });
        },
      ),
      resizeToAvoidBottomInset: false,
    ));
  }
}

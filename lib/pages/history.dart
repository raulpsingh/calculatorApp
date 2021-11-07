import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return History();
  }
}
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
            body: Text('Te'),
          ),
        ));
  }
}


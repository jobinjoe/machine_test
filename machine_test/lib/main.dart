import 'package:flutter/material.dart';
import 'package:machine_test/Pages/HomePage/Home.dart';
import 'package:machine_test/Pages/SelectedEmployeePage/SelectedEmployee.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Machine Test'),
      routes: {
        '/employee': (context) => MyHomePage(title: 'Machine Test'),
        '/elployeeDetails':  (context) => EmployeeData(ModalRoute.of(context).settings.arguments),
      },
    );
  }
}


import 'package:machine_test/Model/employeeModel.dart';

class DataBase {
  // singleton
  static final DataBase _singleton = DataBase._internal();

  //int id;
  //bool networkConnection;
  List<Employees> employees;

  factory DataBase() {
    return _singleton;
  }

  DataBase._internal() {
    employees = [];
    //id = 0;
    //networkConnection = true;
  }

  static DataBase get shared => _singleton;
  
}
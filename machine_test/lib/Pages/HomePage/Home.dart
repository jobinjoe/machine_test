import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:machine_test/ApiManager/ApiManager.dart';
import 'package:machine_test/Database/database.dart';
import 'package:machine_test/Model/employeeModel.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Employees> currentEmployeeList = [];
  int selectedEmployee = -1;
  final userNameFieldControler = TextEditingController();

  searchResult(value) {
    print(value);
    if (value != '') {
      currentEmployeeList = [];

      DataBase.shared.employees.forEach((employee) {
        if ((employee.name.toLowerCase().startsWith(value.toLowerCase())) ||
            (employee.email.toLowerCase().startsWith(value.toLowerCase()))) {
          currentEmployeeList.add(employee);
        }
      });
      
    }else{
      currentEmployeeList = DataBase.shared.employees;
    }
    setState(() {});
  }

  void fetchEmployeedata() async {
    var response = await ApiManager().getEmplyeeData();
    if (response == false) {
      print('no internet');
      return response;
    } else {
      //loginModel = LoginModel.fromJson(response.body);
      //loginModel = LoginModel.fromJson(jsonDecode(response.body));
      print(response.body);
      // addressJson["address"].forEach((e) {
      //       if (e["default_shipping"] ?? false) {
      //         selectedAddress = e;
      //       }
      //     });
      var employeeList = json.decode(response.body);
      for (var employ in employeeList) {
        //Employees employe = Employees();
        DataBase.shared.employees.add(Employees.fromJson(employ));
      }
      currentEmployeeList = DataBase.shared.employees;
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEmployeedata();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNameFieldControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(widget.title),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                child: TextField(
                  controller: userNameFieldControler,
                  decoration: InputDecoration(hintText: 'Search'),
                  onChanged: (value) {
                    searchResult(value);
                  },
                  onSubmitted: (value) {
                    searchResult(value);
                  },
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: currentEmployeeList.length,
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 20),
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            selectedEmployee = currentEmployeeList[index].id;
                            Navigator.pushNamed(context, '/elployeeDetails',
                                arguments: selectedEmployee);
                          },
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration:
                                      currentEmployeeList[index].profileImage !=
                                              null
                                          ? BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    currentEmployeeList[index]
                                                        .profileImage),
                                              ),
                                            )
                                          : null,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                            currentEmployeeList[index].name),
                                      ),
                                      Container(
                                        child: Text(currentEmployeeList[index]
                                                    .company
                                                    .name !=
                                                null
                                            ? currentEmployeeList[index]
                                                .company
                                                .name
                                            : ''),
                                      ),
                                      Container(
                                        child: Text(
                                            currentEmployeeList[index].email),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

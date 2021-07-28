import 'package:flutter/material.dart';
import 'package:machine_test/Database/database.dart';
import 'package:machine_test/Model/employeeModel.dart';


class EmployeeData extends StatefulWidget {
  final int selectedEmployee;
  const EmployeeData(this.selectedEmployee, {Key key}) : super(key: key);

  @override
  _EmployeeDataState createState() => _EmployeeDataState();
}

class _EmployeeDataState extends State<EmployeeData> {
  bool isLoading = true;
  Employees employee = Employees();

  getSelectedEmployee() {
    for (var employeeData in DataBase.shared.employees) {
      print('${employeeData.id} and ${widget.selectedEmployee}');
      if (employeeData.id == widget.selectedEmployee) {
        employee = employeeData;
        break;
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSelectedEmployee();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Employee details'),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: !isLoading? Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: employee.profileImage != null
                      ? BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                employee.profileImage),
                          ),
                        )
                      : null,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("name : ${employee.name}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("username : ${employee.username}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("email address : ${employee.email}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("phone : ${employee.phone}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("website : ${employee.website}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Address : "),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("Street : ${employee.address.street}"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("suite : ${employee.address.suite}"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("city : ${employee.address.city}"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("zipcode : ${employee.address.zipcode}"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("latitude : ${employee.address.latitude}"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("longitude : ${employee.address.longitude}"),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text("Company :"),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("name : ${employee.company.name}"),
                ),Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("catchPhrase : ${employee.company.catchPhrase}"),
                ),Container(
                  margin: EdgeInsets.fromLTRB(25, 10, 10, 10),
                  child: Text("bs : ${employee.company.bs}"),
                ),
              ],
            ):Container(),
          ),
        ));
  }
}

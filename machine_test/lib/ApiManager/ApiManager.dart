import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ApiManager{
  Future<dynamic> getEmplyeeData() async {
    
    var url = 'http://www.mocky.io/v2/5d565297300000680030a986';
    var response;
    try {
      response = await http.get(Uri.parse(url));
    } on SocketException catch (eror) {
      print(eror);
      response = false;
    }
    return response;
  }
}

class APIHeader{
Map<String, String> otpHeader() {
    Map<String, String> headerValue = {
      'client-token':
          'bup6s01NHg0VVeauDESPtX2A3K364ta+A7Qea9Juw5+scu88eucrN54et',
      'Access-Control-Allow-Origin':'*'
    };
    return headerValue;
  }
}
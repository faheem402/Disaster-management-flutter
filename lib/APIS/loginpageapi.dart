
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mark/homepage.dart';

String baseurl = 'http://192.168.1.60:5000';
int? lid;
String? userType;
String? loginStatus;

Future<void> loginApi(
    String username, String password, BuildContext context) async {
  try {
    Dio dio = Dio();

    // Prepare the form data for the POST request
    FormData formData = FormData.fromMap({
      'username': username,
      'password': password,
    });

    // Perform the POST request
    final response = await dio.post('$baseurl/LoginPageApi', data: formData);

    // Check the status code and response data
    print(response.data);
    int statusCode = response.statusCode ?? 0;
    print('Status code: $statusCode');

    // Decode the JSON response
    final data = response.data;

    loginStatus = data['message'] ?? 'failed';

    if (statusCode == 200 && loginStatus == 'success') {
      userType = data['type'];
      lid = data['login_id'];
        
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctxt) => Homepage()));
      // Navigate based on userType
      // if (userType == 'admin') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => AdminHomePage()),
      //   // );
      // } else if (userType == 'user') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => UserHomePage()),
      //   // );
      // } else if (userType == 'doctor') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => Doctorhomepage()),
      //   // );
      // } else {
      //   // Handle unknown userType
      //   print('Unknown userType: $userType');
      // }
    } else {
      print('Login failed: $loginStatus');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $loginStatus'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error during login: $e'),
      ),
    );  
    print('Error during login: $e');
  }
    }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mark/APIS/loginpageapi.dart';

final dio = Dio();

Future<void> registrationdataApi(data,context) async {
  try {
    Response response = await dio.post('$baseurl/UserReg', data: data);
    print(response);
    print(response.statusCode);
    if (response.statusCode == 201) {
      print("success");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Successful'),
          duration: const Duration(seconds: 5),
        ),
      );
      Navigator.pop(context);
    } else {
      throw Exception('failed to get');
    }
  } catch (e) {
    print(e.toString());
    // return [];
  }
}
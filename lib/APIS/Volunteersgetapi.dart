
import 'package:dio/dio.dart';
import 'package:mark/APIS/loginpageapi.dart';

Map<String, dynamic> profileData = {};

final dio = Dio();

Future<Map<String, dynamic>> getComplaintAPI() async {
  try {
    Response response = await dio.get(
      '$baseurl/Viewprofile/$lid',
    );
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("success");
      // List<dynamic> products = response.data;
      // List<Map<String, dynamic>> listdata =
      //     List<Map<String, dynamic>>.from(products);
      profileData = response.data;
      return response.data;
    } else {
      return {};
    }
  } catch (e) {
    print(e.toString());
    return {};
  }
}
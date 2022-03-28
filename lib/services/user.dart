import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newapp/model/signInResponse.dart';

class User {
  String baseUrl = "https://oshan263.000webhostapp.com/login.php";

  Future<signInResponse> login(String username, String pass) async {
    try {
      Map<String, dynamic> jsonMap = {
        'username': username,
        'password': pass,
      };
      String body = json.encode(jsonMap);
      var response = await http.post(Uri.parse(baseUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: body);
      //print(jsonDecode(response.body);
      if (response.statusCode == 200) {
        //(response.body);
        return signInResponse.fromJson(jsonDecode(response.body));
      } else {
        return Future.error("Server Error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

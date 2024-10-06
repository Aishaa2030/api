import 'dart:convert';

import 'package:flutter_app3/models/user.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<User>> getUsers() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    var respons = await http.get(Uri.parse(url));

    if (respons.statusCode == 200) {
      List<dynamic> data = json.decode(respons.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("failed ton losd user");
    }
  }
}

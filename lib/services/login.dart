import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud {
  getRequest(String url) async {
    final response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }

  postRequest(String url, Map data) async {
    final response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }
}

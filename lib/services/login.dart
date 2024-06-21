import 'dart:convert';

import 'package:http/http.dart' as http;

class Crud {
  getRequest(String url) async {
    await Future.delayed(const Duration(seconds: 2));
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }

  postRequest(String url, Map data) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.post(Uri.parse(url),
        body: data);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load post');
    }
  }
}

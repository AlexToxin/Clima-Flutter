import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as Http;

class NetworkHelper {
  final String url;

  NetworkHelper({@required this.url});

  Future<dynamic> getData() async {
    Http.Response response = await Http.get(url);

    if (response.statusCode != 200) {
      print(response.statusCode);
      return null;
    }

    return json.decode(response.body);
  }
}

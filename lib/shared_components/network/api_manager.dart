import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/source_model.dart';
import 'package:news_app/shared_components/constants/constants.dart';

class ApiManager {
  static Future<SourceModel> fetchSources(String category) async {
    var query = {
      "apiKey": Constants.apiKey,
      "category": category,
    };
    final response = await http.get(
      //Uri.parse("https://newsapi.org/v2/top-headlines/sources?category=sports&apiKey=f25d0d8cbb5144e590264153ff87cf51"),
      Uri.https(
        Constants.baseURL,
        "/v2/top-headlines/sources",
        query,
      ),
    );
    var SourceDate =SourceModel.fromJson(jsonDecode(response.body));
    debugPrint(response.body);
    if (response.statusCode == 200 && jsonDecode(response.body)["status"] == "ok") {
      return SourceDate;
    } else {
      throw Exception("API request failed: ${response.statusCode}");
    }

  }
}
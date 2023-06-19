import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/source_model.dart';
import 'package:news_app/shared_components/constants/constants.dart';

class ApiManager {
  static Future<SourceModel> fetchAlbum(String category) async {
    var query = {
      "apiKey": Constants.apiKey,
      "category": category,
    };
    final response = await http.get(
      Uri.https(
        Constants.baseURL,
        "/v2/top-headlines/sources",
        query,
      ),
    );
    if(response.statusCode==200 &&jsonDecode(response.body)["status"]==["ok"]){
      return SourceModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Failed to load sources");
    }
  }
}

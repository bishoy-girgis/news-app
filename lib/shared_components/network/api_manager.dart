import 'package:http/http.dart' as http;
import 'package:news_app/shared_components/constants/constants.dart';

class ApiManager {
  Future<http.Response> fetchAlbum(String category) {
    var query = {
      "apiKey": Constants.apiKey,
      "category": category,
    };
    return http.get(
      Uri.https(
        Constants.baseURL,
        "/v2/top-headlines/sources",
        query,
      ),
    );
  }
}

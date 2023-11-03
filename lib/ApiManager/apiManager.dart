import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/BrowseResponse/CategoryResponse.dart';
import 'package:movies/SearchResponse/SearchResponse.dart';


class apiManager{

  static Future<SearchResponse> get(String search) async {
    var url = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
      'query': search,
      'include_adult': 'false',
      'language': 'en-US',
      'page': '1',
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }

  static Future<CategoryResponse> getCategory() async {
    var url = Uri.https('api.themoviedb.org', '/3/genre/movie/list', {
      'api_key': '91d26df9fb64973d39a9e876ce58da73'
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var categoryResponse = CategoryResponse.fromJson(json);
    return categoryResponse;
  }


}
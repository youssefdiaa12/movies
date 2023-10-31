import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/SearchResponse/SearchResponse.dart';


class apiManager{


  static Future<SearchResponse> get(String search,{String? primary_release_year}) async {
    print(primary_release_year);
    var url = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
      'query': search,
      'include_adult': 'false',
      'language': 'en-US',
      'page': '1',
      'primary_release_year': primary_release_year
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }
}
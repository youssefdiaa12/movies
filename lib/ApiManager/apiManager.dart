import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/BrowseResponse/CategoryResponse.dart';
import 'package:movies/MoviesResponse/MovieCategory.dart';
import 'package:movies/SearchResponse/SearchResponse.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/popularResponse/Popular_Response.dart';


class apiManager {
  static const baseUrl = 'api.themoviedb.org';


  static Future<SearchResponse> get(String search,
      {String? id}) async {
    var url = Uri.https('api.themoviedb.org', '/3/search/movie', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
      'query': search,
      'include_adult': 'false',
      'language': 'en-US',
      'page': '1',
      'id': id,
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var searchResponse = SearchResponse.fromJson(json);
    return searchResponse;
  }

  static Future<NewReleasesResponse> getNewReleases() async {
    var url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
      'language': 'en-US',
      'page': '1',
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newReleasesResponse = NewReleasesResponse.fromJson(json);
    return newReleasesResponse;
  }

  static Future<RecommendedResult> getRecommended() async {
    var apiKey = '6bb49ce0a86b250dcf0f631501a06dc5';
    var baseUrl = 'api.themoviedb.org';
    var url = Uri.https(baseUrl, '/3/tv/top_rated', {'api_key': apiKey});

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    RecommendedResult recommendedResponse = RecommendedResult.fromJson(json);
    return recommendedResponse;
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


  static Future<MovieCategory> getMovies(String genres) async {
    var url = Uri.https('api.themoviedb.org', '/3/discover/movie', {
      'api_key': '91d26df9fb64973d39a9e876ce58da73',
      'with_genres': genres
    });

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var movieCategory = MovieCategory.fromJson(json);
    return movieCategory;
  }


  static Future<PopularResponse> getPopular() async {
    var url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var popularResponse = PopularResponse.fromJson(json);
    return popularResponse;
  }

}
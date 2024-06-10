import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:movies/BrowseResponse/CategoryResponse.dart';
import 'package:movies/BrowseResponse/MoreLikeThis/MoreLikeThisList.dart';
import 'package:movies/BrowseResponse/MovieDetailsContent/MovieContentData.dart';
import 'package:movies/MoviesResponse/MovieCategory.dart';
import 'package:movies/SearchResponse/SearchResponse.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/popularResponse/Popular_Response.dart';

@singleton
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

  static Future<Either<NewReleasesResponse, String>> getNewReleases() async {
    var url = Uri.https(baseUrl, '/3/movie/upcoming', {
      'api_key': '6bb49ce0a86b250dcf0f631501a06dc5',
      'language': 'en-US',
      'page': '1',
    });
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      var newReleasesResponse = NewReleasesResponse.fromJson(json);
      return Left(newReleasesResponse);
    }
    catch (e) {
      print(e);
      return Right(e.toString());
    }
  }

  static Future<Either<RecommendedResult, String>> getRecommended() async {
    var apiKey = '6bb49ce0a86b250dcf0f631501a06dc5';
    var baseUrl = 'api.themoviedb.org';
    var url = Uri.https(baseUrl, '/3/tv/top_rated', {'api_key': apiKey});
try {
  var response = await http.get(url);
  var json = jsonDecode(response.body);
  RecommendedResult recommendedResponse = RecommendedResult.fromJson(json);
  return Left(recommendedResponse);
}
catch (e) {
  print(e);
  return Right(e.toString());
}
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

  static Future<MovieContentData> getContent(int id) async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$id?language=en-US');
    var response = await http.get(
      url,
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YmI0OWNlMGE4NmIyNTBkY2YwZjYzMTUwMWEwNmRjNSIsInN1YiI6IjY1M2Y3NTFjYmMyY2IzMDBhY2E0OTE0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ITwh7NU1_GurrLQJiNqo6Bc7gZOIPhhmkQM_NZopNmQ',
        'Accept': 'application/json',
      },
    );
    var json = jsonDecode(response.body);
    var contentData = MovieContentData.fromJson(json);
    print("bbbb");
    print(contentData.title);
    return contentData;
  }
  static Future<MoreLikeThisList> getMoreLikeThisList(int id) async {
    var url = Uri.parse('https://api.themoviedb.org/3/movie/$id/similar?language=en-US&page=1');
    var response = await http.get(
      url,
      headers: {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2YmI0OWNlMGE4NmIyNTBkY2YwZjYzMTUwMWEwNmRjNSIsInN1YiI6IjY1M2Y3NTFjYmMyY2IzMDBhY2E0OTE0NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ITwh7NU1_GurrLQJiNqo6Bc7gZOIPhhmkQM_NZopNmQ',
        'Accept': 'application/json',
      },
    );
    var json = jsonDecode(response.body);
    var contentData = MoreLikeThisList.fromJson(json);
    print(contentData.results);

    return contentData;
  }



}
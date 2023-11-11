import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/MoreLikeResponseList/MoreLikeListResponse.dart';
import 'package:movies/model/movieDetailsResponse/MovieDetailsResponse.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/ui/HomeTap/movieCard.dart';
import 'package:movies/ui/MovieDetailsScreen/ContentScreen.dart';
import 'package:movies/ui/MovieDetailsScreen/MoreLikeCardsList.dart';

class MoreLikeListWidget extends StatelessWidget {

  MovieDetailsResponse movie;
  MoreLikeListWidget(this.movie);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getMoreLike(movie.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return Center(
            child: Column(
              children: [
                Text(
                     snapshot.error.toString()),
                ElevatedButton(onPressed: () {
                  print("Erroooooooor :${snapshot.error.toString()}");
                }, child: Text('Try Again'))
              ],
            ),
          );
        }
        RecommendedResult? moreLikeMoviesList = snapshot.data;
        return ContentScreen(movie: movie,moreLikeList: moreLikeMoviesList?.results);



      }
    );
  }
}

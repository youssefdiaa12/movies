import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/movieDetailsResponse/MovieDetailsResponse.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/ui/MovieDetailsScreen/ContentScreen.dart';
import 'package:movies/ui/MovieDetailsScreen/MoreLikeListWidget.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = "MovieDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Results;
    return FutureBuilder(
      future: apiManager.getMovieDetails(args.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        MovieDetailsResponse response = snapshot.data!;
        print("RESPONSE DATA  ${response.id}");

        return MoreLikeListWidget(response);
      },
    );
  }
}

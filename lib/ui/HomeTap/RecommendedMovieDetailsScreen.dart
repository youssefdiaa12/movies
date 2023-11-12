import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/BrowseResponse/MovieDetailsContent/MovieContentData.dart';
import 'package:movies/model/newReleasesResponse/NewResult.dart';
import 'package:movies/ui/HomeTap/RecommendedMoviedata.dart';

class RecommendedMovieDetailScreen extends StatefulWidget {
  static const String routeName = '/RecommendedMovieDetailScreen';
  int? id;

  RecommendedMovieDetailScreen({this.id});

  @override
  State<RecommendedMovieDetailScreen> createState() =>
      _RecommendedMovieDetailScreenState();
}

class _RecommendedMovieDetailScreenState
    extends State<RecommendedMovieDetailScreen> {



  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as int;
    widget.id = args;
    return FutureBuilder(
      future: apiManager.getContent(widget.id??0),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data == null) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error?.toString() ?? "Error loading data"),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        MovieContentData? movie = snapshot.data;

          return RecommendedMoviedata(movie);

      },
    );
  }
}

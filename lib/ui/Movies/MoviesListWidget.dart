import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';

import 'MoviesWidget.dart';

class MoviesListWidget extends StatelessWidget {
  static const String routeName = 'MoviesList';
  int? genres;

  MoviesListWidget({this.genres});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as MoviesListWidget;

    return Scaffold(
      body: FutureBuilder(
        future: apiManager.getMovies(args.genres.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      apiManager.getMovies(args.genres.toString());
                    },
                    child: Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          var MoviesList = snapshot.data?.results;
          print(MoviesList?.length);
          return ListView.builder(
            itemBuilder: (context, index) {
              return MovieWidget(MoviesList?[index]);
            },
            itemCount: MoviesList?.length,
          );
        },
      ),
    );
  }
}

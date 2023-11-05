import 'package:flutter/material.dart';
import 'package:movies/model/newReleasesResponse/NewResult.dart';
import 'package:movies/ui/HomeTap/RelaseMovieWidget.dart';
class MovieWidget extends StatefulWidget {
  List<NewResult>? newMovies;
  MovieWidget(this.newMovies);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.newMovies?.length ?? 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        NewResult? movie = widget.newMovies![index];
        return RelaseMovieWidget(movie);
      },
    );
  }
}

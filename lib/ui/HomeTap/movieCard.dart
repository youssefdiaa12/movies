import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieDetailsScreen.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieWidget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MovieCard extends StatefulWidget {
  List<Results>? recommendedMovies;

  MovieCard(this.recommendedMovies, {Key? key}) : super(key: key);

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25.h,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.recommendedMovies?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Results movie = widget.recommendedMovies![index];
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 11.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, RecommendedMovieDetailScreen.routeName,
                      arguments: movie.id);

                  // navigate to movie details screen
                },
                child: Card(
                  color: const Color(0xff343534),
                  surfaceTintColor: Colors.transparent,
                  elevation: 12,
                  child: Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.h,
                          child: RecommendedMovieWidget(recommendedMovie: movie),),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 16.sp,
                            ),
                            Text(
                              movie.voteAverage.toString() ?? "",
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Text(
                          movie.name.toString().substring(
                              0, min(12, movie.name.toString().length)) ??
                              "",
                          style: const TextStyle(color: Colors.white),
                        ),
                        Text(
                          movie.firstAirDate.toString() ?? "",
                          style:  TextStyle(
                            color: const Color(0xffB5B4B4),
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
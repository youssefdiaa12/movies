import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movies/ui/MovieDetailsScreen/MoreLikeMovieWidget.dart';
import 'package:movies/ui/MovieDetailsScreen/MovieDetails.dart';

import '../../SearchResponse/SResults.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';




class MoreLikeCardList extends StatelessWidget {


  List<Results>? moviee;
  MoreLikeCardList({this.moviee});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: moviee?.length ?? 0,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            Results movie = moviee![index];
            return Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 11.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDetails.routeName , arguments: movie);
                },
                child: Card(
                  color: Color(0xff343534),
                  surfaceTintColor: Colors.transparent,
                  elevation: 12,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 137,
                          child: MoreLikeMovieWidget(movie),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Theme
                                    .of(context)
                                    .colorScheme
                                    .secondary,
                                size: 16,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.0),
                                child: Text(
                                  movie.voteAverage.toString() ?? "",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Text(
                            movie.name.toString().substring(
                                0, min(12, movie.name
                                .toString()
                                .length)) ??
                                "",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 11.0),
                          child: Text(
                            movie.firstAirDate.toString() ?? "",
                            style: TextStyle(
                              color: Color(0xffB5B4B4),
                              fontWeight: FontWeight.w400,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
    );
  }

}

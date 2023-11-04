import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/popularResponse/Results.dart';

class popularWidget extends StatelessWidget {
  final Results movies;

  popularWidget(this.movies, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CachedNetworkImage(
                            imageUrl: "https://image.tmdb.org/t/p/original/${movies.backdropPath}"  ?? ''),
                        const Center(
                          child: AnimatedCrossFade(
                            crossFadeState: CrossFadeState.showFirst,
                            duration: Duration(seconds: 1),
                            firstChild: Icon(
                              Icons.play_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                            secondChild: Icon(
                              Icons.pause_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:40.0),
                    child: Column(
                      children: [
                        Text(
                          movies.title?.substring(0,min(20,movies.title!.length)) ?? '',
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                        Text(
                          movies.releaseDate ?? '',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xffB5B4B4),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 10.0),
                    child: Card(
                      elevation: 60,
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          height: 200,
                          width: 129,
                          imageUrl: "https://image.tmdb.org/t/p/original/${movies.backdropPath}"  ?? ''),
                    ),
                  ),

                  IconButton(
                    alignment: Alignment.topLeft,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.bookmark_add_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

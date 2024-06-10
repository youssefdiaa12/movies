import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/model/DataBase/MoviesList.dart';
import 'package:movies/model/newReleasesResponse/Results.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieDetailsScreen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class RelaseMovieWidget extends StatefulWidget {
  Results newMovies;

  RelaseMovieWidget(this.newMovies);

  @override
  State<RelaseMovieWidget> createState() => _RelaseMovieWidgetState();
}

class _RelaseMovieWidgetState extends State<RelaseMovieWidget> {
  MoviesList? movie1;

  @override
  void initState() {
    fetchMovie();
    super.initState();
  }

  void fetchMovie() async {
    provider obj = Provider.of<provider>(context, listen: false);
    movie1 = await obj.getTask(MoviesList(id: widget.newMovies.id.toString()));
  }

  void deleteFromFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.deleteTask(MoviesList(id: widget.newMovies.id.toString()));
  }

  void addToFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.addTask(MoviesList(
        id: widget.newMovies.id.toString(),
        is_added: true,
        name: widget.newMovies.title));
  }

  @override
  Widget build(BuildContext context) {
    provider obj = Provider.of<provider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: const Color(0xff343534),
        surfaceTintColor: Colors.transparent,
        elevation: 12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, RecommendedMovieDetailScreen.routeName,
                          arguments: widget.newMovies.id);
                      //navigate to movie details screen
                    },
                    child: CachedNetworkImage(
                      height: 19.h,
                      width: 28.w,
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500/${widget.newMovies.backdropPath}" ??
                              '',
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                          child: Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Container(
                          height: 19.h,
                          width: 28.w,
                          color: Colors.grey,
                        ),
                      )),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error, color: Colors.grey),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Theme.of(context).colorScheme.secondary,
                        size: 16.sp,
                      ),
                      Text(
                        widget.newMovies.voteAverage.toString() ?? "",
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  Text(
                    widget.newMovies.title?.substring(0,
                            min(12, widget.newMovies.title.toString().length)) ??
                        "",
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text(
                    widget.newMovies.releaseDate.toString() ?? "",
                    style: TextStyle(
                      color: const Color(0xffB5B4B4),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              movie1?.is_added == true
                  ? Padding(
                      padding: EdgeInsets.zero,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            deleteFromFireStore();
                            movie1?.is_added = false;
                          });
                        },
                        child: const Icon(
                          Icons.bookmark_added_rounded,
                          color: Colors.amber,
                          size: 24,
                        ),
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.zero,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            obj.addTask(MoviesList(
                                id: widget.newMovies.id.toString(),
                                is_added: true,
                                name: widget.newMovies.title));
                            movie1?.is_added = true;
                          });
                        },
                        child: const Icon(
                          Icons.bookmark_add_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/DataBase/MoviesList.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class RecommendedMovieWidget extends StatefulWidget {
  static const routeName = '/RecommendedMovieWidget';
  Results? recommendedMovie;

  RecommendedMovieWidget({Key? key, this.recommendedMovie}) : super(key: key);

  @override
  State<RecommendedMovieWidget> createState() => _RecommendedMovieWidgetState();
}

class _RecommendedMovieWidgetState extends State<RecommendedMovieWidget> {
  MoviesList? movie;

  @override
  void initState() {
    super.initState();
    if (widget.recommendedMovie != null) fetchMovie();
  }

  void fetchMovie() async {
    provider obj = Provider.of<provider>(context, listen: false);
    MoviesList fetchedMovie =
        await obj.getTask(MoviesList(id: widget.recommendedMovie?.id.toString()));
    movie = fetchedMovie;
  }

  void deleteFromFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.deleteTask(MoviesList(id: widget.recommendedMovie?.id.toString()));
  }

  void addToFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.addTask(MoviesList(id: widget.recommendedMovie?.id.toString(),
        is_added: true, name: widget.recommendedMovie?.name));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: CachedNetworkImage(
            height: 19.h,
            width: 28.w,
            imageUrl:
                "https://image.tmdb.org/t/p/w500/${widget.recommendedMovie?.backdropPath}" ??
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
              ),
            ),
            errorWidget: (context, url, error) => const Center(
              child: Icon(Icons.error, color: Colors.grey),
            ),
          ),
        ),
        movie?.is_added == true
            ? Padding(
                padding: EdgeInsets.zero,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      deleteFromFireStore();
                      fetchMovie();
                      movie = MoviesList(is_added: false);
                      movie?.is_added = false;
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
                      addToFireStore();
                      fetchMovie();
                      movie?.is_added = true;
                    });
                  },
                  child: const Icon(
                    Icons.bookmark_add_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              )
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/DataBase/MoviesList.dart';
import 'package:movies/Provider/provider.dart';
import 'package:movies/model/newReleasesResponse/NewResult.dart';
import 'package:movies/ui/HomeTap/RecommendedMovieDetailsScreen.dart';
import 'package:provider/provider.dart';

class RelaseMovieWidget extends StatefulWidget {
  NewResult newMovies;

  RelaseMovieWidget(this.newMovies);

  @override
  State<RelaseMovieWidget> createState() => _RelaseMovieWidgetState();
}

class _RelaseMovieWidgetState extends State<RelaseMovieWidget> {
  MoviesList? movie1;

  @override
  void initState() {
    super.initState();
    fetchMovie();
  }

  void fetchMovie() async {
    provider obj = Provider.of<provider>(context, listen: false);
    MoviesList fetchedMovie =
        await obj.getTask(MoviesList(widget.newMovies.id.toString()));
    setState(() {
      movie1 = fetchedMovie;
    });
  }

  void deleteFromFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.deleteTask(MoviesList(widget.newMovies.id.toString()));
  }

  void addToFireStore() async {
    provider obj = Provider.of<provider>(context, listen: false);
    await obj.addTask(MoviesList(widget.newMovies.id.toString(),
        is_added: true, name: widget.newMovies.title));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 11.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, RecommendedMovieDetailScreen.routeName,
                    arguments: widget.newMovies.id);
                //navigate to movie details screen
              },
              child: CachedNetworkImage(
                height: 137,
                width: 86,
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
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        movie1 != null
            ? movie1?.is_added == true
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          deleteFromFireStore();
                          fetchMovie();
                          movie1 = null;
                          movie1?.is_added = false;
                        });
                      },
                      icon: const Icon(
                        Icons.bookmark_added_rounded,
                        color: Colors.amber,
                        size: 24,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.zero,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          addToFireStore();
                          fetchMovie();
                        });
                      },
                      icon: const Icon(
                        Icons.bookmark_add_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  )
            : Padding(
                padding: EdgeInsets.zero,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      addToFireStore();
                      fetchMovie();
                    });
                  },
                  icon: const Icon(
                    Icons.bookmark_add_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
      ],
    );
  }
}

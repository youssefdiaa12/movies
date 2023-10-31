import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/SearchResponse/Results.dart';

class movieWidget extends StatelessWidget {
  Results movies;

  movieWidget(this.movies);

  @override
  Widget build(BuildContext context) {
    print('dada');
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                child: Center(
                  child: CachedNetworkImage(
                    height: 89,
                    width: 140,
                    imageUrl:
                        "https://image.tmdb.org/t/p/w500/${movies.backdropPath}" ??
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
                      child: Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Center(
                        child: const Icon(Icons.error, color: Colors.grey)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        movies.title ?? '',
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        movies.releaseDate?.length == 0
                            ? ''
                            : movies.releaseDate?.substring(0, 4) ?? '',
                        style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.67)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top:14,left:10.0, right:10.0),
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color.fromRGBO(255, 255, 255, 0.67),
            ),
          ),
        ],
      ),
    );
  }
}

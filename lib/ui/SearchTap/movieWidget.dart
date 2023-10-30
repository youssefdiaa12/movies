

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
      child: Row(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: CachedNetworkImage(
                height: 89,
                width: 140,
                imageUrl: "https://image.tmdb.org/t/p/w500/${movies.backdropPath}" ?? '',
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
                errorWidget: (context, url, error) => Center(child: const Icon(Icons.error, color: Colors.grey)),
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
                  Text(movies.releaseDate?.substring(0,4)?? '',style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.67)),),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ClipRect(
// child:InkWell(
// onTap: () {
//
// },
// child:
// CachedNetworkImage(
// imageUrl:  news.overview??'',
// height: 41,
// width:90,
// fit: BoxFit.fill,
// progressIndicatorBuilder: (context, url, downloadProgress) =>
// Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
// errorWidget: (context, url, error) => const Icon(Icons.error),
// ),
// ),
// ),
// Text(
// news.title??'',
// textAlign: TextAlign.start,
// style: const TextStyle(
// color: Color(0xff79828B),
// fontSize: 18,
// fontWeight: FontWeight.w400),
// ),
// Text(
// news.title??'',
// textAlign: TextAlign.start,
// style: const TextStyle(
// color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
// ),
// Text(
// news.overview??'',
//
// textAlign: TextAlign.end,
// style: const TextStyle(
// color: Color(0xffA3A3A3),
// fontSize: 16,
// fontWeight: FontWeight.w800),
// ),
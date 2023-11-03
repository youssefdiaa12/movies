import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/recommendedResponse/RecommendedResult.dart';
import 'package:movies/ui/HomeTap/movieCard.dart';

class RecommendedListWidget extends StatefulWidget {
  const RecommendedListWidget({super.key});

  @override
  State<RecommendedListWidget> createState() => _RecommendedListWidgetState();
}

class _RecommendedListWidgetState extends State<RecommendedListWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiManager.getRecommended(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || snapshot.data?.success == false) {
          return Center(
            child: Column(
              children: [
                Text(
                    snapshot.data?.status_message ?? snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }
        RecommendedResult recommendedList = snapshot.data!;
        return MovieCard(recommendedList.results);
      },
    );
  }
}

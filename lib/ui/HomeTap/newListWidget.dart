import 'package:flutter/material.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/ui/HomeTap/MovieWidget.dart';


class newListWidget extends StatefulWidget {
  const newListWidget({super.key});

  @override
  State<newListWidget> createState() => _newListWidgetState();
}

class _newListWidgetState extends State<newListWidget> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder(
      future: apiManager.getNewReleases(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            ),
          );
        }

        var newReleasesList = snapshot.data?.results;
        return MovieWidget(newReleasesList);
      },
    );

  }
}


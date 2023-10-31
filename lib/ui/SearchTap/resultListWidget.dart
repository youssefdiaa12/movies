import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/SearchTap/movieWidget.dart';
import 'package:movies/ui/SearchTap/searchModel.dart';

class resultListWidget extends StatefulWidget {
  String search;
  String? primary_release_year;

  resultListWidget(this.search, {super.key, this.primary_release_year});

  @override
  State<resultListWidget> createState() => _resultListWidgetState();
}

class _resultListWidgetState extends State<resultListWidget> {
  var model = searchViewModel();

  @override
  Widget build(BuildContext context) {
    model.getMovieData(widget.search, primary_release_year: widget.primary_release_year);
    return BlocBuilder<searchViewModel, movieSearchState>(
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              // implicit casting
              return const Center(

              );
            }
          case ErrorState():
            {
              return Center(
                child: ElevatedButton(
                  child: Text(
                    state.errorMessage ?? 'Error',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    model.getMovieData(widget.search);
                  },
                ),
              );
            }
          case SuccessState():
            {
              return Container( // Add a Container to specify the size of the ListView
                height: MediaQuery.of(context).size.height * 0.8, // Adjust this value as needed
                child: ListView.builder(
                  itemCount: state.results.length ?? 0,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: movieWidget(state.results[index]),
                    );
                  },
                ),
              );
            }
        }
      },
      bloc: model,
    );
  }
}

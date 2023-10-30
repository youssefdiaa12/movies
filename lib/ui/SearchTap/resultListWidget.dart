import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ui/SearchTap/movieWidget.dart';
import 'package:movies/ui/SearchTap/searchModel.dart';

class resultListWidget extends StatefulWidget {
  String search;

  resultListWidget(this.search, {super.key});

  @override
  State<resultListWidget> createState() => _resultListWidgetState();
}

class _resultListWidgetState extends State<resultListWidget> {
  var model = searchViewModel();

  @override
  Widget build(BuildContext context) {
    model.getMovieData(widget.search);
    return BlocBuilder<searchViewModel, movieSearchState>(
      builder: (context, state) {
        switch (state) {
          case LoadingState():
            {
              print('kare');
              // implicit casting
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          case ErrorState():
            {
              print('karem');
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
              print('dodo');
              return
                ListView.builder(
                itemCount: state.results.length ?? 0,
                itemBuilder: (context, index) {
                  print('rana');
                  return movieWidget(state.results[index]);
                },
              );
            }
        }
      },
      bloc: model,
    );
  }
}

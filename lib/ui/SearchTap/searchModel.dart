import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/SearchResponse/Results.dart';

class searchViewModel extends Cubit<movieSearchState> {
  searchViewModel() : super(LoadingState());

  void getMovieData(String search, {String? id}) async {
    emit(LoadingState());
    try {
      var response = await apiManager.get(search,
          id: id);

      for (var i = 0; i < response.results!.length; i++) {
        String search1 = response.results![i].releaseDate!;
        search1 = search1.toLowerCase();
        if (id != null) {
          id = id.toLowerCase();
          for (var j = 0; j < search1.length; j++) {
            if (search1[j] != id[j]) {
              response.results!.removeAt(i);
              break;
            }
          }
        }
      }
      emit(SuccessState(response.results ?? []));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class movieSearchState {}

class LoadingState extends movieSearchState {}

class ErrorState extends movieSearchState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends movieSearchState {
  List<Results> results;

  SuccessState(this.results);
}
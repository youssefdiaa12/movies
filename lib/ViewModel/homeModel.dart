import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/popularResponse/Results.dart';

class homeViewModel extends Cubit<moviePopularState> {
  homeViewModel() : super(LoadingState());
  void getMovieData() async {
    emit(LoadingState());
    try {
      var response = await apiManager.getPopular();

      emit(SuccessState(response.results ?? []));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class moviePopularState {}

class LoadingState extends moviePopularState {}

class ErrorState extends moviePopularState {
  String errorMessage;

  ErrorState(this.errorMessage);
}

class SuccessState extends moviePopularState {
  List<Results> results;

  SuccessState(this.results);
}

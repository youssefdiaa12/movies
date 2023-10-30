import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/SearchResponse/Results.dart';

class searchViewModel extends Cubit<movieSearchState> {
  searchViewModel() : super(LoadingState());

  void getMovieData(String search) async {
    emit(LoadingState());
    try {
      print("search");
      var response = await apiManager.get(search);
      print('rana1');
      print(response.results);
        emit(SuccessState(response.results??[]));
      }
    catch (e) {
      emit(ErrorState(e.toString()));
    }

  }
}




sealed class movieSearchState {

}

class LoadingState extends movieSearchState {
}

class ErrorState extends movieSearchState {
  String errorMessage;
  ErrorState(this.errorMessage);
}

class SuccessState extends movieSearchState {
  List<Results> results;
  SuccessState(this.results);
}

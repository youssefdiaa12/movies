import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/SearchResponse/Results.dart';
import 'package:movies/model/DataBase/MoiveDao.dart';
import 'package:movies/model/DataBase/MoviesList.dart';

class searchViewModel extends Cubit<movieSearchState> {
  searchViewModel() : super(LoadingState());

  void getMovieData(String search, {String? id}) async {
    emit(LoadingState());
    try {
      var response =id==''?await apiManager.get(search):await apiManager.get(search,id: id);
      var answer=response.results!.where((element) => element.id.toString().contains(id!)).toList();
      if(answer.length == 0) {

        MovieDao.deleteTask(MoviesList(id: id.toString()));

      }

      emit(SuccessState(answer ?? []));
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
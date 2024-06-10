import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:movies/model/dataSource/new_relase_data_source.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';

part 'new_release_state.dart';

class NewReleaseCubit extends Cubit<NewReleaseState> {
  NewReleaseDataSource newReleaseDataSource;

  @factoryMethod
  NewReleaseCubit(this.newReleaseDataSource) : super(NewReleaseInitial());

  Future<void> getNewReleases() async {
    emit(NewReleaseLoading());
    try {
      var response = await newReleaseDataSource.getNewReleases();
      if (response is Left) {
        emit(NewReleaseSuccess(response.left));
      }
      else {
        emit(NewReleaseError(response.right));
      }
    }catch (e) {
      emit(NewReleaseError(e.toString()));
    }
  }
}

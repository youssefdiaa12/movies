import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../model/dataSource/recommended_data_source.dart';
import '../model/recommendedResponse/RecommendedResult.dart';

part 'recommended_state.dart';

class RecommendedCubit extends Cubit<RecommendedState> {
  RecommendedDataSource recommendedDataSource;
 @factoryMethod RecommendedCubit(this.recommendedDataSource) : super(RecommendedInitial());

  Future<void> getRecommended() async {
    emit(RecommendedLoading());
    try {
      var response = await recommendedDataSource.getRecommended();
      if (response is Left) {
        emit(RecommendedSuccess(response.left));
      } else {
        emit(RecommendedError(response.right));
      }
    } catch (e) {
      emit(RecommendedError(e.toString()));
    }
  }





}






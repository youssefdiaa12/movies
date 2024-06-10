part of 'recommended_cubit.dart';

@immutable
sealed class RecommendedState {}

final class RecommendedInitial extends RecommendedState {}

final class RecommendedLoading extends RecommendedState {}

final class RecommendedSuccess extends RecommendedState {
  final RecommendedResult recommendedResult;

  RecommendedSuccess(this.recommendedResult);
}

final class RecommendedError extends RecommendedState {
  final String error;

  RecommendedError(this.error);
}

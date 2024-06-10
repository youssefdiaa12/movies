part of 'new_release_cubit.dart';

@immutable
sealed class NewReleaseState {}

final class NewReleaseInitial extends NewReleaseState {}

class NewReleaseLoading extends NewReleaseState {}

class NewReleaseSuccess extends NewReleaseState {
  final NewReleasesResponse newReleasesResponse;

  NewReleaseSuccess(this.newReleasesResponse);
}

class NewReleaseError extends NewReleaseState {
  final String errorMessage;

  NewReleaseError(this.errorMessage);
}

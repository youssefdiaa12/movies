
import 'package:either_dart/either.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';

abstract class NewReleaseDataSource {
   Future<Either<NewReleasesResponse, String>> getNewReleases();


}









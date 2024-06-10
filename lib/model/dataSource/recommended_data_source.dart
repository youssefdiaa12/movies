
import 'package:either_dart/either.dart';

import '../recommendedResponse/RecommendedResult.dart';

abstract class RecommendedDataSource {
  Future<Either<RecommendedResult, String>> getRecommended();


}









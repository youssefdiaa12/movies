import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/dataSource/new_relase_data_source.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';
import '../dataSource/recommended_data_source.dart';
import '../recommendedResponse/RecommendedResult.dart';

@Injectable(as: RecommendedDataSource)
class RecommendedDataSourceImp implements RecommendedDataSource {
  apiManager api_Manager;

  @factoryMethod
  RecommendedDataSourceImp({required this.api_Manager});

  @override
  Future<Either<RecommendedResult, String>> getRecommended() async {
    var response = await apiManager.getRecommended();
    if(response is Left) {
      return Left(response.left);
    }
    return Right(response.right);
  }
}

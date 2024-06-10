import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/ApiManager/apiManager.dart';
import 'package:movies/model/dataSource/new_relase_data_source.dart';
import 'package:movies/model/newReleasesResponse/NewReleasesResponse.dart';

@Injectable(as: NewReleaseDataSource)
class NewReleaseDataSourceImp implements NewReleaseDataSource {
  apiManager api_Manager;

  @factoryMethod
  NewReleaseDataSourceImp({required this.api_Manager});

  @override
  Future<Either<NewReleasesResponse, String>> getNewReleases() async {
    var response = await apiManager.getNewReleases();
   if(response is Left) {
     return Left(response.left);
   }
   return Right(response.right);
  }
}

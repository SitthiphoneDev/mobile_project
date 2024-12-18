import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/features/auth/constants/auth_api_path.dart';
import 'package:mobile_project/features/auth/model/auth_account_info_model.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_client.g.dart';

@injectable
@RestApi()
abstract class AuthApiClient {
  @factoryMethod
  factory AuthApiClient(Dio dio) = _AuthApiClient;

  @GET(AuthApiPath.getAccountInfo)
  Future<AuthAccountInfoModel> getAccountInfo();

  @POST(AuthApiPath.login)
  Future<bool> login(
    @Body() FormData body,
  );
}
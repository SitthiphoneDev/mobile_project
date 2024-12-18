
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/features/auth/data/auth_api_client.dart';
import 'package:mobile_project/features/auth/model/auth_account_info_model.dart';

abstract class AuthDataRepository {
  Future<AuthAccountInfoModel > getAccountInfo();
  Future<bool> login({required String username, required String password});
}

@LazySingleton(as: AuthDataRepository)
class AuthDataRepositoryImpl implements AuthDataRepository{
  final AuthApiClient _apiClient;
  AuthDataRepositoryImpl(this._apiClient);
  
  @override
  Future<AuthAccountInfoModel> getAccountInfo() async{
    return await _apiClient.getAccountInfo();
  }
  

  @override
  Future<bool> login({required String username, required String password}) async {
    return await _apiClient.login(FormData.fromMap({
      "username" : username,
      "password" : password
    }));
  }

}

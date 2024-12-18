

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/constants/api_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routers/app_router.dart';
import '../services/interceptor_service.dart';

@module
abstract class InjectionModule{
  @preResolve
  Future<SharedPreferences> get sharedPreference => SharedPreferences.getInstance();

  @lazySingleton
  AppRouter get appRouter => AppRouter();
  InterceptorsWrapper get intercepter => IntercepterService.instance.initialInterceptors();
  Dio get dio => Dio(BaseOptions(baseUrl: ApiPath.baseUrl))..interceptors.add(intercepter);
}

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mobile_project/DI/service_locator.dart';
import 'package:mobile_project/constants/share_preference_key.dart';
import 'package:mobile_project/services/shared_preference_service.dart';

class IntercepterService {
    // Private constructor
  IntercepterService._privateConstructor();

  // Static instance of the class
  static final IntercepterService _instance = IntercepterService._privateConstructor();

  // Getter to access the instance
  static IntercepterService get instance => _instance;

  InterceptorsWrapper initialInterceptors() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = _getToken;
        // add token to header
        if (token != null) {
          options.headers['Authorization'] = "Bearer $token";
        }
        // TODO: create custom log
        log('\x1B[33m => Request ${options.method} to -> ${options.uri}  \x1B[33m');
        log('\x1B[32m => Token -> $token  \x1B[32m');
        handler.next(options);
      },
      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) {
        log('\x1B[31m => Request error ${error. requestOptions.uri} \x1B[31m');
        handler.next(error);
      },
    );
  }

  String? get _getToken {
    return getIt<SharedPreferenceService>().getData(key: SharePreferenceKey.token);
  }
}

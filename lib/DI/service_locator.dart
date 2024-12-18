import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_project/DI/service_locator.config.dart';


final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies({String? env}) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await getIt.init(environment: env); 
  await getIt.init();
}
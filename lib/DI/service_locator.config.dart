// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mobile_project/DI/register_modules.dart' as _i51;
import 'package:mobile_project/features/auth/data/auth_api_client.dart'
    as _i379;
import 'package:mobile_project/features/auth/data/auth_repository.dart'
    as _i749;
import 'package:mobile_project/features/auth/states/auth_cubit.dart' as _i713;
import 'package:mobile_project/features/home/states/home_cubit.dart' as _i788;
import 'package:mobile_project/features/setting/state/settings_cubit.dart'
    as _i810;
import 'package:mobile_project/routers/app_router.dart' as _i1042;
import 'package:mobile_project/services/shared_preference_service.dart'
    as _i534;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => injectionModule.sharedPreference,
      preResolve: true,
    );
    gh.factory<_i361.InterceptorsWrapper>(() => injectionModule.intercepter);
    gh.factory<_i361.Dio>(() => injectionModule.dio);
    gh.factory<_i788.HomeCubit>(() => _i788.HomeCubit());
    gh.factory<_i810.SettingsCubit>(() => _i810.SettingsCubit());
    gh.lazySingleton<_i1042.AppRouter>(() => injectionModule.appRouter);
    gh.lazySingleton<_i534.SharedPreferenceService>(() =>
        _i534.SharedPreferenceService(pref: gh<_i460.SharedPreferences>()));
    gh.factory<_i379.AuthApiClient>(() => _i379.AuthApiClient(gh<_i361.Dio>()));
    gh.lazySingleton<_i749.AuthDataRepository>(
        () => _i749.AuthDataRepositoryImpl(gh<_i379.AuthApiClient>()));
    gh.factory<_i713.AuthCubit>(
        () => _i713.AuthCubit(gh<_i749.AuthDataRepository>()));
    return this;
  }
}

class _$InjectionModule extends _i51.InjectionModule {}

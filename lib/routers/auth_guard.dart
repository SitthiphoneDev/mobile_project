import 'package:auto_route/auto_route.dart';
import 'package:mobile_project/constants/share_preference_key.dart';
import 'package:mobile_project/routers/app_router.dart';
import 'package:mobile_project/services/shared_preference_service.dart';


class AppRouteGuard extends AutoRouteGuard {
  final SharedPreferenceService sharedPreferenceService;
  AppRouteGuard(this.sharedPreferenceService);

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    String? token = sharedPreferenceService.getData<String>(key: SharePreferenceKey.token);
    if (token != null) {
      resolver.next();
    } else {
      resolver.redirect(const LoginRoute(),replace: true);
    }
  }
}

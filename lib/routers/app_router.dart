import 'package:auto_route/auto_route.dart';
import 'package:mobile_project/pages/cart_page.dart';
import 'package:mobile_project/pages/categories_page.dart';
import 'package:mobile_project/pages/home_page.dart';
import 'package:mobile_project/pages/navbar.dart';
import 'package:mobile_project/pages/profile_page.dart';
import 'package:mobile_project/pages/sale_page.dart';
import 'package:mobile_project/pages/settings_page.dart';
import 'package:mobile_project/pages/wishlist_page.dart';
import '../pages/login_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: NavBarRoute.page, initial: true, children: [
          AutoRoute(page: HomeRoute.page, initial: true),
          AutoRoute(page: CategoriesRoute.page),
          AutoRoute(page: CartRoute.page),
          AutoRoute(page: WishlistRoute.page),
          AutoRoute(page: ProfileRoute.page),
        ]),
        // guards: [AppRouteGuard(getIt<SharedPreferenceService>())]
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: SaleRoute.page),
      ];
}

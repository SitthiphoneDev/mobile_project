import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/DI/service_locator.dart';
import 'package:mobile_project/features/home/states/home_cubit.dart';
import 'package:mobile_project/routers/app_router.dart';
import 'package:mobile_project/theme/app_colors.dart';
import 'package:mobile_project/theme/custom_text_theme.dart';

@RoutePage()
class NavBarPage extends StatelessWidget implements AutoRouteWrapper {
  const NavBarPage({super.key});
  @override
  Widget wrappedRoute(BuildContext context) {
     BlocProvider(
       create: (context) => getIt<HomeCubit>()
     );
    return this;
  }
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        CategoriesRoute(),
        CartRoute(),
        WishlistRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: NavigationBarTheme(
            data: NavigationBarThemeData(
              height: 83,
              backgroundColor: Colors.white,
              indicatorColor: AppColors.primaryPurple,
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.selected)) {
                  return Theme.of(context)
                      .textTheme
                      .lableBtmBarStyle
                      .copyWith(color: AppColors.primaryPurple);
                }
                return Theme.of(context).textTheme.lableBtmBarStyle;
              }),
            ),
            child: NavigationBar(
              selectedIndex: tabsRouter.activeIndex,
              onDestinationSelected: (index) {
                tabsRouter.setActiveIndex(index);
              },
              destinations: [
                _buildNavigationDestination(
                  icon: Icons.home_outlined,
                  selectedIcon: Icons.home,
                  label: 'Home',
                ),
                _buildNavigationDestination(
                  icon: Icons.category_outlined,
                  selectedIcon: Icons.category,
                  label: 'Categories',
                ),
                _buildNavigationDestination(
                  icon: Icons.shopping_cart_outlined,
                  selectedIcon: Icons.shopping_cart,
                  label: 'Cart',
                ),
                _buildNavigationDestination(
                  icon: Icons.favorite_border_outlined,
                  selectedIcon: Icons.favorite,
                  label: 'Wishlist',
                ),
                _buildNavigationDestination(
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  NavigationDestination _buildNavigationDestination({
    required IconData icon,
    required IconData selectedIcon,
    required String label,
  }) {
    return NavigationDestination(
      icon: Icon(icon),
      selectedIcon: Icon(selectedIcon),
      label: label,
    );
  }
}

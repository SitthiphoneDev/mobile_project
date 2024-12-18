import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/DI/service_locator.dart';
import 'package:mobile_project/features/home/models/product_model.dart';
import 'package:mobile_project/features/home/states/home_cubit.dart';
import 'package:mobile_project/features/home/widgets/custom_drawer.dart';
import 'package:mobile_project/generated/locale_keys.g.dart';
import 'package:mobile_project/pages/sale_page.dart';
import 'package:mobile_project/routers/app_router.dart';
import 'package:mobile_project/theme/custom_text_theme.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeCubit>()),
      ],
      child: DefaultTabController(
        length: 7,
        child: this,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          LocaleKeys.name.tr(),
          style: Theme.of(context).textTheme.titleText.copyWith(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        bottom: MenuConfiguration().tabBarMenu(),
        actions: [
          PopupMenuButton(
            iconColor: Colors.white,
            onOpened: null,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'settings',
                child: const Row(
                  children: [
                    Icon(Icons.settings),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
                onTap: () => context.router.push(const SettingsRoute()),
              ),
              const PopupMenuItem(
                value: 'copy',
                child: Row(
                  children: [
                    Icon(Icons.copy),
                    SizedBox(width: 8),
                    Text('Copy'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'share',
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(width: 8),
                    Text('Share'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 8),
                    Text('Delete'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              switch (value) {
                case 'settings':
                  break;
                case 'copy':
                  break;
                case 'share':
                  break;
                case 'delete':
                  break;
              }
            },
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: TabBarView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ProductGrid(products: mockProducts),
          ),
          // Other tabs - placeholder content
          const Center(child: SalePage()),
          const Center(child: Text('Order')),
          const Center(child: Text('Import')),
          const Center(child: Text('Export')),
          const Center(child: Text('Search')),
          const Center(child: Text('Report')),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(product: products[index]);
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice = NumberFormat.currency(
      symbol: 'LAK ',
      decimalDigits: 0,
    ).format(product.price);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formattedPrice,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.amber[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating}',
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${product.reviewCount})',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuConfiguration {
  final List<String> items = [
    'data management',
    'sale',
    'order',
    'import',
    'export',
    'search',
    'report'
  ];

  final List<IconData> tabIcons = [
    Icons.storage_rounded,
    Icons.attach_money_rounded,
    Icons.receipt_long_rounded,
    Icons.cloud_download_rounded,
    Icons.cloud_upload_rounded,
    Icons.manage_search_rounded,
    Icons.analytics_rounded,
  ];

  final List<Color> iconColors = [
    Colors.amber,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.red,
    Colors.teal,
    Colors.indigo,
  ];

  final List<double> iconSizes = List.filled(7, 24.0);

  PreferredSizeWidget tabBarMenu() {
    return TabBar(
      isScrollable: true,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white70,
      tabs: List.generate(
        tabIcons.length,
        (index) => Tab(
          icon: Icon(
            tabIcons[index],
            color: iconColors[index],
            size: iconSizes[index],
          ),
          text: items[index].toUpperCase(),
        ),
      ),
    );
  }
}

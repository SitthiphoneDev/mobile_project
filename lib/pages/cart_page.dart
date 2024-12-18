import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile_project/theme/custom_text_theme.dart';

@RoutePage()
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
          style: Theme.of(context)
              .textTheme
              .titleText
              .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:mobile_project/features/home/widgets/drawer_header.dart';
import 'package:mobile_project/features/home/widgets/drawer_items_list.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          CustomDrawerHeader(),
          DrawerItemsList(),
        ],
      ),
    );
  }
}
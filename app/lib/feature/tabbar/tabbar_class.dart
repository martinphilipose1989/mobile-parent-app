import 'dart:ui';

import 'package:flutter/material.dart';

class DrawerItems {
  final String? menu;

  final String? route;
  final String? icon;
  final VoidCallback? onTap; // Callback function
  final bool? isActive;
  final bool? isSelected;
  DrawerItems( {this.isSelected, this.menu,this.isActive,  this.route, this.icon, this.onTap});
}

class MenuItem{
  final String? menuItem;
  final bool? menuItemActive;
final List<DrawerItems>? drawerItmes;
  MenuItem({ this.drawerItmes, this.menuItem, this.menuItemActive});
}

class DrawerItems {
  final String? menu;

  final String? route;
  final String? icon;

  bool? isActive;
  final bool? isSelected;
  final String key;
  DrawerItems(
      {this.isSelected,
      this.menu,
      this.isActive,
      this.route,
      this.icon,
      required this.key});
}

class MenuItem {
  final String? menuItem;
  final bool? menuItemActive;
  final List<DrawerItems>? drawerItmes;
  MenuItem({this.drawerItmes, this.menuItem, this.menuItemActive});
}

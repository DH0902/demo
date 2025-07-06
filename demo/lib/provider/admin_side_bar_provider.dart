import 'package:flutter/material.dart';

class AdminSideBarProvider extends ChangeNotifier {
  String _selectedMenu = '';
  String get selectedMenu => _selectedMenu;

  String _selectedSubMenu = '';
  String get selectedSubMenu => _selectedSubMenu;

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateMenu(String menu, int index) {
    if (_selectedMenu != menu || _selectedIndex != index) {
      _selectedMenu = menu;
      _selectedIndex = index;
      _selectedSubMenu = '';
    }
  }

  void updateSubMenu(String subMenu) {
    if (_selectedSubMenu != subMenu) {
      _selectedSubMenu = subMenu;
    }
  }

  void refresh() => notifyListeners();
}

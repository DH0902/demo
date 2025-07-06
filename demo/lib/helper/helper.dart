import 'package:demo/constants/menu_keys.dart';
import 'package:demo/constants/menu_tabs.dart';
import 'package:flutter/material.dart';

class Helper {
  static String? getSubmenuPath(String mainLabel, String subLabel) {
    if (mainLabel.isEmpty || subLabel.isEmpty) return null;

    final mainTab = adminTabs.firstWhere(
      (tab) => tab[MenuKeys.label] == mainLabel,
      orElse: () => {},
    );

    final submenu = mainTab[MenuKeys.submenu];
    if (submenu is! List) return null;

    final subTab = (submenu as List).cast<Map<String, dynamic>>().firstWhere(
          (item) => item[MenuKeys.label] == subLabel,
          orElse: () => {},
        );

    return subTab[MenuKeys.path] as String?;
  }

  static Map<String, dynamic> _getSelectedTab(int index) => adminTabs[index];

  static List<dynamic> _getSubMenu(Map<String, dynamic> tab) =>
      tab[MenuKeys.submenu] as List<dynamic>;

  static String getMainMenuLabel(int index) {
    final tab = _getSelectedTab(index);
    return tab[MenuKeys.label] as String;
  }

  static String getMenuDefaultSubMenuPath(int index) {
    final tab = _getSelectedTab(index);
    final submenu = _getSubMenu(tab);
    return submenu[0][MenuKeys.path] as String;
  }

  static bool isEmpty(dynamic value) {
    if (value == null) return true;

    if (value is String) {
      return value.trim().isEmpty;
    }

    if (value is List || value is Map || value is Set || value is Iterable) {
      return value.isEmpty;
    }

    return false;
  }
}

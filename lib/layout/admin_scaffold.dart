import 'package:demo/constants/menu_keys.dart';
import 'package:demo/constants/menu_tabs.dart';
import 'package:demo/helper/helper.dart';
import 'package:demo/provider/admin_side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AdminScaffold extends StatefulWidget {
  final Widget child;

  const AdminScaffold({super.key, required this.child});

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  String selectedMenu = '';

  final tabs = adminTabs;

  void _selectMainMenu(int index) {
    final selectedLabel = Helper.getMainMenuLabel(index);
    final selectedPath = Helper.getMenuDefaultSubMenuPath(index);

    context.read<AdminSideBarProvider>()
      ..updateMenu(selectedLabel, index)
      ..updateSubMenu(selectedPath)
      ..refresh();

    context.go(selectedPath);
  }

  void _selectSubMenu(String path) {
    context.read<AdminSideBarProvider>()
      ..updateSubMenu(path)
      ..refresh();

    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            color: const Color(0xFFF8F8FC),
            child: Selector<AdminSideBarProvider, int>(
              selector: (p0, p1) => p1.selectedIndex,
              builder: (_, selectedIndex, __) => ListView.builder(
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  final tab = tabs[index];
                  final isSelected = selectedIndex == index;

                  return InkWell(
                    onTap: () => _selectMainMenu(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      color: isSelected
                          ? const Color(0xFFEAE6F8)
                          : Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildMainTab(tab, isSelected),
                          if (isSelected) _buildSubMenu(selectedIndex),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Widget _buildSubMenu(int selectedIndex) {
    final submenu = tabs[selectedIndex][MenuKeys.submenu] as List<dynamic>;

    return Selector<AdminSideBarProvider, String>(
      selector: (p0, p1) => p1.selectedSubMenu,
      builder: (_, selectedSubMenu, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: submenu.map(
            (menu) {
              if (Helper.isEmpty(selectedSubMenu)) {
                selectedSubMenu = submenu[0][MenuKeys.path] as String;
              }

              final label = menu[MenuKeys.label] as String;
              final path = menu[MenuKeys.path] as String;
              final isSelected = selectedSubMenu == path;

              return InkWell(
                onTap: () => _selectSubMenu(path),
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 12, left: 40),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? Colors.deepPurple : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              );
            },
          ).toList()),
    );
  }

  Widget _buildMainTab(Map<String, dynamic> tab, bool isSelected) {
    return Row(
      children: [
        Icon(
          tab[MenuKeys.icon] as IconData,
          color: isSelected ? Colors.deepPurple : Colors.black,
        ),
        const SizedBox(width: 12),
        Text(
          tab[MenuKeys.label]! as String,
          style: TextStyle(
            color: isSelected ? Colors.deepPurple : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

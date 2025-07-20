import 'package:demo/constants/menu_keys.dart';
import 'package:demo/constants/menu_tabs.dart';
import 'package:demo/helper/helper.dart';
import 'package:demo/provider/admin_side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Set<int> _hoveredIndexes = {};
  String? _hoveredSubMenuPath;
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
            color: const Color(0xFFEBEBEB),
            child: Selector<AdminSideBarProvider, int>(
              selector: (p0, p1) => p1.selectedIndex,
              builder: (_, selectedIndex, __) => ListView.builder(
                itemCount: tabs.length,
                itemBuilder: (context, index) {
                  final tab = tabs[index];
                  final isSelected = selectedIndex == index;
                  final isHovered = _hoveredIndexes.contains(index);

                  return Column(
                    children: [
                      MouseRegion(
                        onEnter: (_) =>
                            setState(() => _hoveredIndexes.add(index)),
                        onExit: (_) =>
                            setState(() => _hoveredIndexes.remove(index)),
                        child: InkWell(
                          onTap: () => _selectMainMenu(index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            color: Colors.transparent,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                      left: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isHovered &&
                                              Helper.isEmpty(
                                                  _hoveredSubMenuPath)
                                          ? const Color(0xFFE0E0E0)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: _buildMainTab(tab, isSelected)),
                                if (isSelected) _buildSubMenu(selectedIndex),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: Container(color: Color(0xFFF1F1F1), child: widget.child),
          ),
        ],
      ),
    );
  }

  Widget _buildSubMenu(int selectedIndex) {
    final submenu = tabs[selectedIndex][MenuKeys.submenu] as List<dynamic>;

    return Selector<AdminSideBarProvider, String>(
      selector: (p0, p1) => p1.selectedSubMenu,
      builder: (_, selectedSubMenu, __) => SizedBox(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: submenu.map(
              (menu) {
                if (Helper.isEmpty(selectedSubMenu)) {
                  selectedSubMenu = submenu[0][MenuKeys.path] as String;
                }

                final label = menu[MenuKeys.label] as String;
                final path = menu[MenuKeys.path] as String;
                final isSelected = selectedSubMenu == path;
                final isHovered = _hoveredSubMenuPath == path;

                return MouseRegion(
                  onEnter: (_) => setState(() => _hoveredSubMenuPath = path),
                  onExit: (_) => setState(() => _hoveredSubMenuPath = null),
                  child: InkWell(
                    onTap: () => _selectSubMenu(path),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.white
                            : isHovered
                                ? const Color(0xFFDADADA)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.subdirectory_arrow_right,
                            color: Colors.black54,
                            size: 16,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            label,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList()),
      ),
    );
  }

  Widget _buildMainTab(Map<String, dynamic> tab, bool isSelected) {
    return Row(
      children: [
        if (!Helper.isEmpty(tab[MenuKeys.icon])) ...{
          Icon(
            tab[MenuKeys.icon] as IconData,
            color: Colors.black,
            size: 20,
          ),
        } else ...{
          SvgPicture.asset(
            tab[MenuKeys.svgIcon],
            width: 16,
            height: 16,
          ),
        },
        const SizedBox(width: 12),
        Text(
          tab[MenuKeys.label]! as String,
          style: TextStyle(
            color: Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

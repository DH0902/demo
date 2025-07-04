import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AdminScaffold extends StatefulWidget {
  final Widget child;

  const AdminScaffold({super.key, required this.child});

  @override
  State<AdminScaffold> createState() => _AdminScaffoldState();
}

class _AdminScaffoldState extends State<AdminScaffold> {
  String selectedMenu = '';
  int selectedIndex = 0;

  final tabs = [
    {
      'icon': Icons.shopping_cart,
      'label': 'Staff',
      'path': '/staff',
    },
    {
      'icon': Icons.inventory,
      'label': 'Customer',
      'path': '/customer',
      'submenu': [
        {'label': 'All Customer', 'path': '/allCustomers'},
        {'label': 'New Customer', 'path': '/newCustomer'}
      ],
    },
  ];

  void _selectedMenu(String value) {
    debugPrint('menu : $value');
    setState(() {
      selectedMenu = value;
    });
  }

  void _selectedIndex(int value) {
    debugPrint('value : $value');
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;

    // int selectedIndex = switch (true) {
    //   _ when location.startsWith('/newCustomer') => 1,
    //   _ => 0,
    // };

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            color: const Color(0xFFF8F8FC),
            child: ListView.builder(
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                final tab = tabs[index];
                final isSelected = selectedIndex == index;
                debugPrint('selectedIndex : $selectedIndex ');
                debugPrint('isSelected : $isSelected ');

                return InkWell(
                  onTap: () {
                    _selectedMenu(tab['label'] as String);
                    _selectedIndex(index);
                  },
                  // onTap: () => context.go(tab['path'] as String),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 12),
                    color: isSelected
                        ? const Color(0xFFEAE6F8)
                        : Colors.transparent,
                    child: Column(
                      children: [
                        _buildMainTab(tab, isSelected),
                        if (isSelected) _buildSubMenu(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: widget.child),
        ],
      ),
    );
  }

  Widget _buildSubMenu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Text(
            'All Customers',
            textAlign: TextAlign.start,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Text(
            'New Customer',
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }

  Widget _buildMainTab(Map<String, Object> tab, bool isSelected) {
    return Row(
      children: [
        Icon(
          tab['icon'] as IconData,
          color: isSelected ? Colors.deepPurple : Colors.black,
        ),
        const SizedBox(width: 12),
        Text(
          tab['label']! as String,
          style: TextStyle(
            color: isSelected ? Colors.deepPurple : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

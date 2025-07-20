import 'package:demo/common/page/common_tab_content_design.dart';
import 'package:demo/common/page/common_table.dart';
import 'package:demo/common/page/common_view_all_design.dart';
import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/staff/all_staff_tab.dart';
import 'package:demo/provider/admin_side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllCustomersView extends StatefulWidget {
  const AllCustomersView({super.key});

  @override
  State<AllCustomersView> createState() => _AllCustomerViewState();
}

class _AllCustomerViewState extends State<AllCustomersView> {
  final TextEditingController _searchController = TextEditingController();

  List<Customer> filteredCustomer = [];

  final columnLabels = [
    'Customer name',
    'Email Subscription',
    'Orders',
    'Location',
    'Amount spent',
    'Action',
  ];

  final contentRows = [
    Customer(
      name: 'Joker',
      subscription: 'Not subscribed',
      location: 'Malaysia',
      orders: 10,
      amount: 1000.00,
    ),
    Customer(
      name: 'Ferlix',
      subscription: 'Subscribed',
      location: 'Malaysia',
      orders: 10,
      amount: 10000.00,
    ),
    Customer(
      name: 'Bird',
      subscription: 'Subscribed',
      location: 'Hong Kong',
      orders: 20,
      amount: 1000.00,
    ),
    Customer(
      name: 'Aoi',
      subscription: 'Not subscribed',
      location: 'Japan',
      orders: 20,
      amount: 1000.00,
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    filteredCustomer = contentRows;
    _searchController.addListener(_filterCustomers);
  }

  void _handleCreateNewCustomer() {
    context.read<AdminSideBarProvider>().updateSubMenu('/customer/newCustomer');
    context.routeTo('Customer', 'New Customer');
  }

  void _filterCustomers() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredCustomer = contentRows;
      });
      return;
    }

    List<Customer> selectedCustomer = [];
    final parsedQuery = int.tryParse(query);
    if (parsedQuery != null) {
      selectedCustomer = filteredCustomer
          .where((cust) =>
              cust.amount == parsedQuery || cust.orders == parsedQuery)
          .toList();
    } else {
      selectedCustomer = filteredCustomer
          .where((cust) =>
              cust.name.toLowerCase().contains(query) ||
              cust.location.toLowerCase().contains(query) ||
              cust.subscription.toLowerCase().contains(query))
          .toList();
    }
    setState(() {
      filteredCustomer = selectedCustomer;
    });
  }

  void _showRecord() {
    context.go('/customer/viewCustomerRecord');
  }

  Widget _viewAllCustomers() {
    final columns =
        columnLabels.map((label) => DataColumn(label: Text(label))).toList();
    final rows = filteredCustomer.map((e) {
      return DataRow(
          color: WidgetStateColor.resolveWith((_) {
            return const Color(0xFFF7F7F7);
          }),
          cells: [
            DataCell(Text(e.name)),
            DataCell(Text(e.subscription)),
            DataCell(Text('${e.orders}')),
            DataCell(Text(e.location)),
            DataCell(Text('${e.amount}')),
            DataCell(
              TextButton(
                onPressed: _showRecord,
                child: Text('View Details'),
              ),
            )
          ]);
    }).toList();

    return CommonTable(columns: columns, rows: rows);
  }

  @override
  Widget build(BuildContext context) {
    return CommonViewAllDesign(
      createNewFunction: () => _handleCreateNewCustomer(),
      pageTitle: 'Customers',
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search customers",
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              // isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.search),
              ),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.sort),
              ),
            ),
          ),
          SizedBox(
            width: context.screenWidth,
            child: _viewAllCustomers(),
          ),
        ],
      ),
    );
  }
}

class Customer {
  final String name;
  final String subscription;
  final String location;
  final int orders;
  final double amount;

  const Customer({
    required this.name,
    required this.subscription,
    required this.location,
    required this.orders,
    required this.amount,
  });
}

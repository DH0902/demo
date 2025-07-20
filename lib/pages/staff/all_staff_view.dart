import 'package:demo/common/page/common_tab_content_design.dart';
import 'package:demo/common/page/common_table.dart';
import 'package:demo/common/page/common_view_all_design.dart';
import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/staff/all_staff_tab.dart';
import 'package:demo/provider/admin_side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllStaffsView extends StatefulWidget {
  const AllStaffsView({super.key});

  @override
  State<AllStaffsView> createState() => _AllStaffViewState();
}

class _AllStaffViewState extends State<AllStaffsView> {
  final TextEditingController _searchController = TextEditingController();

  List<Staff> filteredCustomer = [];

  final columnLabels = [
    'Customer name',
    'Email Subscription',
    'Orders',
    'Location',
    'Amount spent'
  ];

  final contentRows = [
    Staff(
      name: 'Joker',
      subscription: 'Not subscribed',
      location: 'Malaysia',
      orders: 10,
      amount: 1000.00,
    ),
    Staff(
      name: 'Ferlix',
      subscription: 'Subscribed',
      location: 'Malaysia',
      orders: 10,
      amount: 10000.00,
    ),
    Staff(
      name: 'Bird',
      subscription: 'Subscribed',
      location: 'Hong Kong',
      orders: 20,
      amount: 1000.00,
    ),
    Staff(
      name: 'Aoi',
      subscription: 'Not subscribed',
      location: 'Japan',
      orders: 20,
      amount: 1000.00,
    ),
  ];

  @override
  void initState() {
    super.initState();
    filteredCustomer = contentRows;
    _searchController.addListener(_filterStaffs);
  }

  Widget _viewAllStaffs() {
    final columns =
        columnLabels.map((label) => DataColumn(label: Text(label))).toList();
    final rows = filteredCustomer.map((e) {
      return DataRow(cells: [
        DataCell(Text(e.name)),
        DataCell(Text(e.subscription)),
        DataCell(Text(e.location)),
        DataCell(Text('${e.orders}')),
        DataCell(Text('${e.amount}')),
      ]);
    }).toList();

    return CommonTable(columns: columns, rows: rows);
  }

  void _handleCreateNewStaff() {
    context.read<AdminSideBarProvider>().updateSubMenu('/staff/newStaff');
    context.routeTo('Staff', 'New Staff');
  }

  void _filterStaffs() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        filteredCustomer = contentRows;
      });
      return;
    }

    List<Staff> selectedCustomer = [];
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

  @override
  Widget build(BuildContext context) {
    return CommonViewAllDesign(
      createNewFunction: () => _handleCreateNewStaff(),
      pageTitle: 'Staffs',
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: "Search Staffs",
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              // isDense: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.search),
              ),
              // border:
              //     OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          SizedBox(
            width: context.screenWidth,
            child: _viewAllStaffs(),
          ),
        ],
      ),
    );
  }
}

class Staff {
  final String name;
  final String subscription;
  final String location;
  final int orders;
  final double amount;

  const Staff({
    required this.name,
    required this.subscription,
    required this.location,
    required this.orders,
    required this.amount,
  });
}

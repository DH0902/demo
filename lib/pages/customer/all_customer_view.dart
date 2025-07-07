import 'package:demo/common/page/common_tab_content_design.dart';
import 'package:demo/common/page/common_view_all_design.dart';
import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/staff/all_staff_tab.dart';
import 'package:demo/provider/admin_side_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllCustomersView extends StatefulWidget {
  const AllCustomersView({super.key});

  @override
  State<AllCustomersView> createState() => _AllCustomerViewState();
}

class _AllCustomerViewState extends State<AllCustomersView>
    with SingleTickerProviderStateMixin {
  final tabs = ['All', 'Active', 'Inactive'];
  final tabsContent = [
    AllStaffTab(),
    AllStaffTab(),
    AllStaffTab(),
  ];

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: tabs.length, vsync: this);
    super.initState();
  }

  void _handleCreateNewCustomer() {
    context.read<AdminSideBarProvider>().updateSubMenu('/customer/newCustomer');
    context.routeTo('Customer', 'New Customer');
  }

  Widget _viewAllCustomers() {
    return CommonTabContentDesign(
      tabs: tabs,
      tabsContent: tabsContent,
      tabController: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonViewAllDesign(
      createNewFunction: () => _handleCreateNewCustomer(),
      pageTitle: 'Customers',
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: context.screenHeight * 0.8,
        child: _viewAllCustomers(),
      ),
    );
  }
}

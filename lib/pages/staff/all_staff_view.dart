import 'package:demo/common/page/common_tab_content_design.dart';
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

class _AllStaffViewState extends State<AllStaffsView>
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

  Widget _viewAllStaffs() {
    return CommonTabContentDesign(
      tabs: tabs,
      tabsContent: tabsContent,
      tabController: controller,
    );
  }

  void _handleCreateNewStaff() {
    context.read<AdminSideBarProvider>().updateSubMenu('/staff/newStaff');
    context.routeTo('Staff', 'New Staff');
  }

  @override
  Widget build(BuildContext context) {
    return CommonViewAllDesign(
      createNewFunction: () => _handleCreateNewStaff(),
      pageTitle: 'Staffs',
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: context.screenHeight * 0.8,
        child: _viewAllStaffs(),
      ),
    );
  }
}

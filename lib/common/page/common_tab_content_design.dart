import 'package:flutter/material.dart';

class CommonTabContentDesign extends StatelessWidget {
  final List<String> tabs;
  final List<Widget> tabsContent;
  final TabController tabController;

  const CommonTabContentDesign({
    super.key,
    required this.tabs,
    required this.tabsContent,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: tabController,
          tabs: tabs.map((tab) => Text(tab)).toList(),
          isScrollable: true,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: tabsContent,
          ),
        )
      ],
    );
  }
}

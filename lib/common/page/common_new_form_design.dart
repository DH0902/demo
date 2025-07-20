import 'package:demo/common/common_new_form_address.dart';
import 'package:demo/common/page/common_new_form_name.dart';
import 'package:demo/common/page/common_staff_selection.dart';
import 'package:flutter/material.dart';

class CommonNewFormDesign extends StatefulWidget {
  final String title;
  final String id;
  final bool isEditable;
  final dynamic data;

  const CommonNewFormDesign({
    super.key,
    required this.title,
    required this.id,
    this.isEditable = true,
    this.data,
  });

  @override
  State<CommonNewFormDesign> createState() => _CommonNewFormDesignState();
}

class _CommonNewFormDesignState extends State<CommonNewFormDesign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_outline),
              Icon(Icons.navigate_next_rounded),
              Text('New ${widget.title}')
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonNewFormName(
                    title: widget.title,
                    id: widget.id,
                    data: widget.data,
                    isEditable: widget.isEditable,
                  ),
                  const SizedBox(height: 20),
                  CommonNewFormAddress(),
                  if (widget.title == 'Customer') ...{
                    const SizedBox(height: 20),
                    CommonStaffSelection(),
                  }
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(onPressed: () {}, child: Text('Save')),
          ),
        ],
      ),
    );
  }
}

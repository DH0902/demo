import 'package:demo/common/page/common_new_form_design.dart';
import 'package:flutter/material.dart';

class CustomerRecord extends StatefulWidget {
  final dynamic data;

  const CustomerRecord({super.key, this.data});

  @override
  State<CustomerRecord> createState() => _CustomerRecordState();
}

class _CustomerRecordState extends State<CustomerRecord> {
  @override
  Widget build(BuildContext context) {
    return CommonNewFormDesign(
      title: 'Customer',
      id: 'CUST1234',
      isEditable: false,
      data: widget.data,
    );
  }
}

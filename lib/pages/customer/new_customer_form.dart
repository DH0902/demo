import 'package:demo/common/page/common_new_form_design.dart';
import 'package:flutter/material.dart';

class NewCustomerForm extends StatefulWidget {
  const NewCustomerForm({super.key});

  @override
  State<NewCustomerForm> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<NewCustomerForm> {
  @override
  Widget build(BuildContext context) {
    return CommonNewFormDesign(
      title: 'Customer',
      id: 'CUST#1234',
    );
  }
}

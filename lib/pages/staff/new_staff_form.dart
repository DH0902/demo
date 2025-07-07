import 'package:demo/common/page/common_new_form_design.dart';
import 'package:flutter/material.dart';

class NewStaffForm extends StatefulWidget {
  const NewStaffForm({super.key});

  @override
  State<NewStaffForm> createState() => _NewStaffFormState();
}

class _NewStaffFormState extends State<NewStaffForm> {
  @override
  Widget build(BuildContext context) {
    return CommonNewFormDesign(
      title: 'Staff',
      id: 'STAFF#1234',
    );
  }
}

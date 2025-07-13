import 'package:demo/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CommonStaffSelection extends StatefulWidget {
  const CommonStaffSelection({super.key});

  @override
  State<CommonStaffSelection> createState() => _CommonStaffSelectionState();
}

class _CommonStaffSelectionState extends State<CommonStaffSelection> {
  final List<String> staffs = ['David', 'Bryen', 'Million', 'Philip'];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedValue = staffs.first;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
      ),
      width: context.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Staff details',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(height: 20),
          DropdownButton(
            isExpanded: true,
            value: selectedValue,
            items: staffs
                .map((staff) => DropdownMenuItem<String>(
                      value: staff,
                      child: Text(staff),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

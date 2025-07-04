import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/widgets/form.dart';
import 'package:flutter/material.dart';

class CustomerView extends StatefulWidget {
  const CustomerView({super.key});

  @override
  State<CustomerView> createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        height: context.screenHeight * 0.6,
        width: context.screenWidth * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Profile Form',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 20),
            CommonForm(id: 'CUST#1234'),
          ],
        ),
      ),
    );
  }
}

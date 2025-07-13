import 'package:demo/pages/widgets/form.dart';
import 'package:flutter/material.dart';

class CommonNewFormAddress extends StatefulWidget {
  const CommonNewFormAddress({super.key});

  @override
  State<CommonNewFormAddress> createState() => _CommonNewFormAddressState();
}

class _CommonNewFormAddressState extends State<CommonNewFormAddress> {
  int newRowNumber = 0;

  void _addNewRow() {
    if (newRowNumber < 2) {
      setState(() {
        newRowNumber += 1;
      });
    }
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Default address',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Text('The primary address of this customer'),
          const SizedBox(height: 20),
          Column(
            children: List.generate(newRowNumber, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: index < 1 ? 20 : 0),
                child: FormTextFormField(
                  isEnable: true,
                  hint: 'Address ${index + 1}',
                ),
              );
            }),
          ),
          if (newRowNumber < 2)
            GestureDetector(
              onTap: _addNewRow,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Row(
                      children: [
                        Icon(Icons.add_circle_outline_sharp),
                        SizedBox(width: 20),
                        Text('Add address'),
                      ],
                    ),
                    Icon(Icons.navigate_next_outlined),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

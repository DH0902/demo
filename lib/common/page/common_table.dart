import 'package:flutter/material.dart';

class CommonTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  const CommonTable({required this.columns, required this.rows, super.key});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          return Colors.grey[200]; // Your custom color here
        },
      ),
      columns: columns,
      rows: rows,
    );
  }
}

import 'package:demo/common/page/common_new_form_design.dart';
import 'package:demo/common/page/common_table.dart';
import 'package:demo/extensions/context_extension.dart';
import 'package:demo/pages/bank/all_bank_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomerRecord extends StatefulWidget {
  final dynamic data;

  const CustomerRecord({super.key, this.data});

  @override
  State<CustomerRecord> createState() => _CustomerRecordState();
}

class _CustomerRecordState extends State<CustomerRecord> {
  final columns = ['Draft Order', 'Date', 'Customer', 'Status', 'Total'];
  final contentRows = [
    Order(
      customerName: 'Joker',
      id: '#D1',
      date: '1 minute ago',
      status: 'Open',
      amount: 'RM 1.23',
    ),
    Order(
      customerName: '111 111',
      id: '#D2',
      date: '8:34PM',
      status: 'Open',
      amount: 'RM 12.23',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          _buildTitleRow(),
          SizedBox(height: 20),
          _buildAmountInfo(),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLeftPanel(),
              const SizedBox(width: 10),
              _buildRightPanel(),
            ],
          ),
        ],
      ),
    );
  }

  TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 14);

  Widget _buildLeftPanel() {
    return Flexible(
      flex: 3,
      child: Column(
        children: [
          _buildCustomerOrderInfo(),
          const SizedBox(height: 10),
          _buildCustomerOrderTable(),
        ],
      ),
    );
  }

  Widget _buildRightPanel() {
    return Flexible(
      flex: 2,
      child: Column(
        children: [_buildCustomerInfo()],
      ),
    );
  }

  Widget _buildCustomerOrderTable() {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.grey.shade300),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: CommonTable(
        columns: columns.map((item) => DataColumn(label: Text(item))).toList(),
        rows: contentRows.map((item) {
          return DataRow(
            color: WidgetStateColor.resolveWith((_) {
              return const Color(0xFFF7F7F7);
            }),
            cells: [
              DataCell(Text(item.id!)),
              DataCell(Text(item.date!)),
              DataCell(Text(item.customerName!)),
              DataCell(Text(item.status!)),
              DataCell(Text(item.amount!)),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCustomerOrderInfo() {
    return Container(
      width: context.screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Last order placed', style: textStyle),
          const SizedBox(height: 10),
          Text("This customer hasn't placed any orders yet"),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor:
                  WidgetStateColor.resolveWith((_) => Colors.white),
              foregroundColor:
                  WidgetStateColor.resolveWith((_) => Colors.black),
            ),
            child: Text('Create Order', style: textStyle),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo() {
    return Container(
      // width: context.screenWidth * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Customer', style: textStyle),
                PopupMenuButton(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Contact Information', style: textStyle),
            const SizedBox(height: 20),
            Text('email@email.com'),
            const SizedBox(height: 10),
            Text('Will receive notifications in English'),
            const SizedBox(height: 20),
            Text('Default Address', style: textStyle),
            const SizedBox(height: 20),
            Text('111 111'),
            const SizedBox(height: 10),
            Text('Malaysia'),
            const SizedBox(height: 20),
            Text('Marketing', style: textStyle),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.crop_square_rounded, size: 10),
                    const SizedBox(width: 10),
                    Text('Email not subcribed'),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.crop_square_rounded, size: 10),
                    const SizedBox(width: 10),
                    Text('SMS not subcribed'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Staff details', style: textStyle),
            const SizedBox(height: 20),
            Text('Winson'),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountInfo() {
    final content = [
      _buildColumnContent('Amount Spent', 'RM 0.00'),
      _buildColumnContent('Orders', '0'),
      _buildColumnContent('Customer since', 'About 3 hours'),
      _buildColumnContent('RFM Group', 'Prospects'),
    ];
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      width: context.screenWidth,
      child: Row(
        children: content
            .asMap()
            .entries
            .map((entry) => _buildSizedBoxWithWidget(
                  entry.value,
                  showDivider: entry.key != content.length - 1,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildColumnContent(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle.copyWith(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted,
              decorationThickness: 1.5,
            ),
          ),
          SizedBox(height: 10),
          Text(value, style: textStyle),
        ],
      ),
    );
  }

  Widget _buildSizedBoxWithWidget(Widget child, {bool showDivider = true}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: showDivider
              ? Border(right: BorderSide(color: Colors.grey.shade300))
              : null,
        ),
        // width: context.screenWidth * 0.21,
        child: child,
      ),
    );
  }

  Widget _buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/icons/customer_icon.svg',
                width: 16, height: 16),
            SizedBox(width: 10),
            Icon(Icons.navigate_next, size: 15),
            SizedBox(width: 10),
            Text(
              'Joker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor:
                WidgetStateColor.resolveWith((_) => Colors.grey.shade300),
            foregroundColor: WidgetStateColor.resolveWith((_) => Colors.black),
          ),
          onPressed: () {},
          child: Row(
            children: [
              Text('More actions', style: textStyle),
              const SizedBox(width: 10),
              Icon(Icons.expand_more)
            ],
          ),
        ),
      ],
    );
  }
}

class Order {
  final String? id;
  final String? date;
  final String? customerName;
  final String? status;
  final String? amount;

  Order({
    this.id,
    this.amount,
    this.date,
    this.customerName,
    this.status,
  });
}

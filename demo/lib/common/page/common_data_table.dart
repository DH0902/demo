import 'package:flutter/material.dart';

class CommonDataTable extends StatelessWidget {
  final List<dynamic> dataList;

  const CommonDataTable({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(),
        const Divider(thickness: 1),
        ListView.separated(
          shrinkWrap: true,
          itemCount: dataList.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (context, index) {
            final data = dataList[index];
            return _buildRow(context, data);
          },
        ),
      ],
    );
  }

  Widget _buildRow(BuildContext context, dynamic staff) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(flex: 1, child: Text(staff.id.toString())),
          Expanded(
            flex: 3,
            child: Text(
              staff.name,
              style: const TextStyle(color: Colors.deepPurple),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Expanded(flex: 2, child: Text(staff.department)),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(staff.phone),
                Text(staff.email, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
                child: Text(staff.requests.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold))),
          ),
          Expanded(flex: 2, child: Text(staff.hireDate)),
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text("ID", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 3,
            child: Text("Name", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 2,
            child: Text("Department",
                style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 4,
            child:
                Text("Contact", style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 1,
            child: Text("Requests",
                style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 2,
            child: Text("Hire Date",
                style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(
            flex: 1,
            child:
                Text("Actions", style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    );
  }
}

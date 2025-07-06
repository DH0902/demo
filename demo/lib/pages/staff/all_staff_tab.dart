import 'package:demo/common/page/common_data_table.dart';
import 'package:flutter/material.dart';

class AllStaffTab extends StatefulWidget {
  const AllStaffTab({super.key});

  @override
  State<AllStaffTab> createState() => _AllStaffTabState();
}

class _AllStaffTabState extends State<AllStaffTab> {
  final List<StaffMember> staffList = [
    StaffMember(
      id: 1,
      name: "Ethan Antonio",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      department: "Admin",
      phone: "+1 404-233-7961",
      email: "admin@centrovo.com",
      requests: 1,
      hireDate: "2019-06-06",
    ),
    StaffMember(
      id: 2,
      name: "Ethan",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      department: "Admin",
      phone: "+1 404-233-7961",
      email: "admin@centrovo.com",
      requests: 1,
      hireDate: "2019-06-06",
    ),
    StaffMember(
      id: 3,
      name: "Sakamoto",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      department: "Admin",
      phone: "+1 404-233-7961",
      email: "admin@centrovo.com",
      requests: 1,
      hireDate: "2019-06-06",
    ),
    StaffMember(
      id: 4,
      name: "Pepe",
      imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
      department: "Admin",
      phone: "+1 404-233-7961",
      email: "admin@centrovo.com",
      requests: 1,
      hireDate: "2019-06-06",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CommonDataTable(dataList: staffList);
  }
}

class StaffMember {
  final int id;
  final String name;
  final String imageUrl;
  final String department;
  final String phone;
  final String email;
  final int requests;
  final String hireDate;

  StaffMember({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.department,
    required this.phone,
    required this.email,
    required this.requests,
    required this.hireDate,
  });
}

import 'package:flutter/material.dart';

final List<Map<String, dynamic>> adminTabs = [
  {
    'icon': Icons.shopping_cart,
    'label': 'Staff',
    'path': '/staff',
    'submenu': [
      {'label': 'All Staff', 'path': '/staff/allStaffs'},
      {'label': 'New Staff', 'path': '/staff/newStaff'},
    ],
  },
  {
    'icon': Icons.inventory,
    'label': 'Customer',
    'path': '/customer',
    'submenu': [
      {'label': 'All Customer', 'path': '/customer/allCustomers'},
      {'label': 'New Customer', 'path': '/customer/newCustomer'}
    ],
  },
];

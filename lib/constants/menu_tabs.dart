import 'package:flutter/material.dart';

final List<Map<String, dynamic>> adminTabs = [
  {
    'icon': Icons.shopping_cart,
    'svgIcon': null,
    'label': 'Staff',
    'path': '/staff',
    'submenu': [
      {'label': 'All Staff', 'path': '/staff/allStaffs'},
      {'label': 'New Staff', 'path': '/staff/newStaff'},
    ],
  },
  {
    'icon': Icons.inventory,
    'svgIcon': null,
    'label': 'Customer',
    'path': '/customer',
    'submenu': [
      {'label': 'All Customer', 'path': '/customer/allCustomers'},
      {'label': 'New Customer', 'path': '/customer/newCustomer'}
    ],
  },
  {
    'icon': null,
    'svgIcon': 'assets/icons/bank_icon.svg',
    'label': 'Bank',
    'path': '/bank',
    'submenu': [
      {'label': 'All Bank', 'path': '/bank/allBank'},
    ],
  },
  {
    'icon': null,
    'svgIcon': 'assets/icons/loan_icon.svg',
    'label': 'Loan',
    'path': '/loan',
    'submenu': [
      {'label': 'All Loan', 'path': '/loan/allLoan'},
    ],
  },
];

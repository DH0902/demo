import 'package:demo/layout/admin_scaffold.dart';
import 'package:demo/pages/customer/all_customer_view.dart';
import 'package:demo/pages/customer/customer_record.dart';
import 'package:demo/pages/customer/new_customer_form.dart';
import 'package:demo/pages/staff/all_staff_view.dart';
import 'package:demo/pages/staff/new_staff_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyRouterConfig {
  final GoRouter router = GoRouter(
    initialLocation: '/staff/allStaffs',
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return AdminScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/staff',
            name: 'staff',
            builder: (context, state) => const SizedBox.shrink(),
            routes: [
              GoRoute(
                path: 'allStaffs',
                builder: (context, state) => AllStaffsView(),
              ),
              GoRoute(
                path: 'newStaff',
                builder: (context, state) => NewStaffForm(),
              ),
            ],
            // builder: (context, state) => StaffView(),
          ),
          GoRoute(
            path: '/customer',
            name: 'customer',
            builder: (context, state) => const SizedBox.shrink(),
            routes: [
              GoRoute(
                path: 'allCustomers',
                builder: (context, state) => AllCustomersView(),
              ),
              GoRoute(
                path: 'newCustomer',
                builder: (context, state) => NewCustomerForm(),
              ),
              GoRoute(
                path: 'viewCustomerRecord',
                builder: (context, state) => CustomerRecord(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

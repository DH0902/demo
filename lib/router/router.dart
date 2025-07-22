import 'package:demo/layout/admin_scaffold.dart';
import 'package:demo/pages/bank/all_bank_view.dart';
import 'package:demo/pages/customer/all_customer_view.dart';
import 'package:demo/pages/customer/customer_record.dart';
import 'package:demo/pages/customer/new_customer_form.dart';
import 'package:demo/pages/loan/all_loan_view.dart';
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
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AllStaffsView(),
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: 'newStaff',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: NewStaffForm(),
                  key: state.pageKey,
                ),
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
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AllCustomersView(),
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: 'newCustomer',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: NewCustomerForm(),
                  key: state.pageKey,
                ),
              ),
              GoRoute(
                path: 'viewCustomerRecord',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: CustomerRecord(),
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/bank',
            name: 'bank',
            builder: (context, state) => const SizedBox.shrink(),
            routes: [
              GoRoute(
                path: 'allBank',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AllBankView(),
                  key: state.pageKey,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/loan',
            name: 'loan',
            builder: (context, state) => const SizedBox.shrink(),
            routes: [
              GoRoute(
                path: 'allLoan',
                pageBuilder: (context, state) => NoTransitionPage(
                  child: AllLoanView(),
                  key: state.pageKey,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

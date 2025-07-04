import 'package:demo/layout/admin_scaffold.dart';
import 'package:demo/pages/staff_view.dart';
import 'package:demo/pages/customer_view.dart';
import 'package:go_router/go_router.dart';

class MyRouterConfig {
  final GoRouter router = GoRouter(
    initialLocation: '/staff',
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) {
          return AdminScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: '/staff',
            name: 'staff',
            builder: (context, state) => StaffView(),
          ),
          GoRoute(
            path: '/customer',
            name: 'customer',
            builder: (context, state) => CustomerView(),
          ),
        ],
      ),
    ],
  );
}

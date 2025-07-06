import 'package:demo/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  void routeTo(String mainLabel, String subLabel) {
    final location = Helper.getSubmenuPath(mainLabel, subLabel);

    if (Helper.isEmpty(location)) {
      return;
    }

    go(location!);
  }
}

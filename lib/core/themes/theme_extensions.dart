import 'package:flutter/material.dart';
import 'package:performance_online_system/core/themes/theme.dart';

extension AppColors on BuildContext {
  ColorFamily get success {
    final Brightness brightness = Theme.of(this).brightness;

    return brightness == Brightness.light
        ? MaterialTheme.success.light
        : MaterialTheme.success.dark;
  }

  ColorFamily get warning {
    final Brightness brightness = Theme.of(this).brightness;

    return brightness == Brightness.light
        ? MaterialTheme.warning.light
        : MaterialTheme.warning.dark;
  }

  ColorFamily get info {
    final Brightness brightness = Theme.of(this).brightness;

    return brightness == Brightness.light ? MaterialTheme.info.light : MaterialTheme.info.dark;
  }
}

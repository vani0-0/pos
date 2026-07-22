import 'package:flutter/material.dart' as material;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_mode.g.dart';

@riverpod
class ThemeMode extends _$ThemeMode {
  @override
  material.ThemeMode build() {
    return material.ThemeMode.light;
  }

  void toggle() {
    state = switch (state) {
      material.ThemeMode.light => material.ThemeMode.dark,
      material.ThemeMode.dark => material.ThemeMode.light,
      _ => material.ThemeMode.dark,
    };
  }
}

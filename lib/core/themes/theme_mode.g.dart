// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeMode)
final themeModeProvider = ThemeModeProvider._();

final class ThemeModeProvider
    extends $NotifierProvider<ThemeMode, material.ThemeMode> {
  ThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeModeHash();

  @$internal
  @override
  ThemeMode create() => ThemeMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(material.ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<material.ThemeMode>(value),
    );
  }
}

String _$themeModeHash() => r'888de01c444955ead9b4a3db4c4be675e0f3847e';

abstract class _$ThemeMode extends $Notifier<material.ThemeMode> {
  material.ThemeMode build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<material.ThemeMode, material.ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<material.ThemeMode, material.ThemeMode>,
              material.ThemeMode,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

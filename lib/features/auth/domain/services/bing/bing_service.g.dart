// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bing_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BingService)
final bingServiceProvider = BingServiceProvider._();

final class BingServiceProvider
    extends $AsyncNotifierProvider<BingService, String> {
  BingServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bingServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bingServiceHash();

  @$internal
  @override
  BingService create() => BingService();
}

String _$bingServiceHash() => r'0faa144e75cf97369f7422f0806d51bde11f6f6d';

abstract class _$BingService extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemoteDatasource)
final authRemoteDatasourceProvider = AuthRemoteDatasourceProvider._();

final class AuthRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDatasource,
          AuthRemoteDatasource,
          AuthRemoteDatasource
        >
    with $Provider<AuthRemoteDatasource> {
  AuthRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDatasource create(Ref ref) {
    return authRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDatasource>(value),
    );
  }
}

String _$authRemoteDatasourceHash() =>
    r'51fccc07263bd0dbe7b1ff8800ed6bea50c26b74';

@ProviderFor(authMockDatasource)
final authMockDatasourceProvider = AuthMockDatasourceProvider._();

final class AuthMockDatasourceProvider
    extends
        $FunctionalProvider<
          AuthMockDatasource,
          AuthMockDatasource,
          AuthMockDatasource
        >
    with $Provider<AuthMockDatasource> {
  AuthMockDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authMockDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authMockDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthMockDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthMockDatasource create(Ref ref) {
    return authMockDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthMockDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthMockDatasource>(value),
    );
  }
}

String _$authMockDatasourceHash() =>
    r'eb5c0501ececa6202f9d3a3d46976c4a513e4597';

@ProviderFor(authDatasource)
final authDatasourceProvider = AuthDatasourceProvider._();

final class AuthDatasourceProvider
    extends $FunctionalProvider<AuthDatasource, AuthDatasource, AuthDatasource>
    with $Provider<AuthDatasource> {
  AuthDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authDatasourceHash();

  @$internal
  @override
  $ProviderElement<AuthDatasource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthDatasource create(Ref ref) {
    return authDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthDatasource>(value),
    );
  }
}

String _$authDatasourceHash() => r'1240b3c6743bf5166ad775fd501531b6edc23503';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'08e0c811cb738ea81bdd50a11dad4176737da67f';

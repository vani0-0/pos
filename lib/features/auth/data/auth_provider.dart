import 'package:performance_online_system/core/configs/env.dart';
import 'package:performance_online_system/core/networks/dio_provider.dart';
import 'package:performance_online_system/features/auth/data/datasources/auth_datasource.dart';
import 'package:performance_online_system/features/auth/data/datasources/auth_mock_datasource.dart';
import 'package:performance_online_system/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:performance_online_system/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:performance_online_system/features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  return AuthRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
AuthMockDatasource authMockDatasource(Ref ref) {
  return AuthMockDatasource();
}

@riverpod
AuthDatasource authDatasource(Ref ref) {
  return Env.isMock
      ? ref.watch(authMockDatasourceProvider)
      : ref.watch(authRemoteDatasourceProvider);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(ref.watch(authDatasourceProvider));
}

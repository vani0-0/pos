import 'package:performance_online_system/features/auth/data/datasources/auth_datasource.dart';
import 'package:performance_online_system/features/auth/domain/repositories/auth_repository.dart';
import 'package:performance_online_system/features/employee/data/model/employee_model.dart';
import 'package:performance_online_system/features/employee/domain/entities/employee.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote);
  final AuthDatasource _remote;

  @override
  Future<Employee> login({required String employeeId, required String password}) async {
    final EmployeeModel model = await _remote.login(employeeId: employeeId, password: password);
    return model.toEntity();
  }

  @override
  Future<void> logout() async {}
}

import 'package:performance_online_system/features/employee/employee.dart';

abstract interface class AuthRepository {
  Future<Employee> login({required String employeeId, required String password});
  Future<void> logout();
}

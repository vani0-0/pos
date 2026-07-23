import 'package:performance_online_system/features/employee/employee.dart';

abstract interface class AuthDatasource {
  Future<EmployeeModel> login({required String employeeId, required String password});
  Future<void> logout();
}

import 'package:dio/dio.dart';
import 'package:performance_online_system/features/auth/data/datasources/auth_datasource.dart';
import 'package:performance_online_system/features/employee/employee.dart';

class AuthRemoteDatasource implements AuthDatasource {
  AuthRemoteDatasource(this._dio);

  final Dio _dio;

  @override
  Future<EmployeeModel> login({required String employeeId, required String password}) async {
    final Response<Map<String, dynamic>> response = await _dio.post(
      '/login',
      data: {
        'employeeId': employeeId,
        'password': password,
      },
    );

    return EmployeeModel.fromJson(response.data!);
  }

  @override
  Future<void> logout() async {}
}

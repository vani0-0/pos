import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:performance_online_system/core/errors/api_exception.dart';
import 'package:performance_online_system/features/auth/data/datasources/auth_datasource.dart';
import 'package:performance_online_system/features/employee/data/model/employee_model.dart';

class AuthMockDatasource implements AuthDatasource {
  @override
  Future<EmployeeModel> login({required String employeeId, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    if (password.trim().isEmpty) {
      throw const ApiException('Password is required');
    }

    final String json = await rootBundle.loadString('assets/mock/accounts.json');
    final accounts = jsonDecode(json) as List;
    final Map<String, dynamic> account = accounts.cast<Map<String, dynamic>>().firstWhere(
      (account) =>
          (account['employeeId'] as String).toLowerCase() == employeeId.trim().toLowerCase(),
      orElse: () => throw const ApiException(
        'No employee found with that Employee ID.',
      ),
    );

    if ((account['password'] as String) != password) {
      throw const ApiException(
        'The password you entered is incorrect.',
      );
    }

    return EmployeeModel(
      id: account['id'] as int,
      employeeId: account['employeeId'] as String,
    );
  }

  @override
  Future<void> logout() async {}
}

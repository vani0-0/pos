import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:performance_online_system/features/employee/domain/entities/employee.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
abstract class EmployeeModel with _$EmployeeModel {
  const factory EmployeeModel({
    required int id,
    required String employeeId,
  }) = _EmployeeModel;
  const EmployeeModel._();

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => _$EmployeeModelFromJson(json);

  Employee toEntity() {
    return Employee(id: id, employeeId: employeeId);
  }
}

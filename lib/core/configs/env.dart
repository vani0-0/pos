import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class Env {
  static String get apiBaseUrl => dotenv.env['API_BASE_URL'] ?? '';

  static bool get isMock => (dotenv.env['ENVIRONMENT'] ?? 'mock') == 'mock';
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_online_system/app/app.dart';

// Change
Future<void> main() async {
  const String env = String.fromEnvironment('ENV', defaultValue: 'mock');
  await dotenv.load(fileName: '.env.$env');

  runApp(const ProviderScope(child: App()));
}

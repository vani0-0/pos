import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RouterNotifier extends ChangeNotifier {
  RouterNotifier(this._ref);

  final Ref _ref;

  String? redirect(BuildContext context, GoRouterState state) {
    return null;
  }
}

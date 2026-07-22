import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:performance_online_system/features/auth/presentation/login/login_state.dart';
import 'package:performance_online_system/features/auth/presentation/login/login_view_model.dart';
import 'package:performance_online_system/shared/theme/app_spacing.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LoginState state = ref.watch(loginViewModelProvider);
    final LoginViewModel viewModel = ref.read(loginViewModelProvider.notifier);

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final FocusNode employeeIdFocus = useFocusNode();
    final FocusNode passwordFocus = useFocusNode();

    OutlineInputBorder border(Color color, {double width = 1}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: color,
          width: width,
        ),
      );
    }

    InputDecoration inputDecoration({
      required String hint,
      required Widget prefixIcon,
      Widget? suffixIcon,
      String? errorText,
    }) {
      return InputDecoration(
        hintText: hint,
        errorText: errorText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        border: border(colorScheme.outlineVariant),
        enabledBorder: border(colorScheme.outlineVariant),
        focusedBorder: border(colorScheme.primary, width: 2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.xxl,
          ),
          child: Card(
            elevation: 2,
            color: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xxl),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.dashboard_customize_rounded,
                    size: 48,
                    color: colorScheme.primary,
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  Text(
                    'Welcome Back',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  Text(
                    'Login to Performance Operations System',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  TextFormField(
                    focusNode: employeeIdFocus,
                    textInputAction: TextInputAction.next,
                    onChanged: viewModel.updateEmployeeId,
                    onFieldSubmitted: (_) {
                      passwordFocus.requestFocus();
                    },
                    decoration: inputDecoration(
                      hint: 'Employee ID',
                      prefixIcon: const Icon(Icons.badge_outlined),
                      errorText: state.form.employeeId.errorMessage,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  TextFormField(
                    focusNode: passwordFocus,
                    obscureText: !state.showPassword,
                    textInputAction: TextInputAction.done,
                    onChanged: viewModel.updatePassword,
                    onFieldSubmitted: (_) => viewModel.login(),
                    decoration: inputDecoration(
                      hint: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline),
                      errorText: state.form.password.errorMessage,
                      suffixIcon: IconButton(
                        onPressed: viewModel.toggleShowPassword,
                        icon: Icon(
                          state.showPassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  FilledButton(
                    onPressed: state.isSubmitting ? null : viewModel.login,
                    style: FilledButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      minimumSize: const Size.fromHeight(58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: SizedBox(
                      height: 22,
                      child: Center(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 150),
                          child: state.isSubmitting
                              ? SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: colorScheme.onPrimary,
                                  ),
                                )
                              : Text(
                                  'Log in',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.md),

                  AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: AnimatedOpacity(
                      opacity: state.formError == null ? 0 : 1,
                      duration: const Duration(milliseconds: 200),
                      child: state.formError == null
                          ? const SizedBox.shrink()
                          : Container(
                              padding: const EdgeInsets.all(AppSpacing.md),
                              decoration: BoxDecoration(
                                color: colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 20,
                                    color: colorScheme.onErrorContainer,
                                  ),
                                  const SizedBox(width: AppSpacing.sm),
                                  Expanded(
                                    child: Text(
                                      state.formError!,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

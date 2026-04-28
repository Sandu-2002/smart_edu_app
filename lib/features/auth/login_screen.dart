import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';
import '../../core/widgets/app_button.dart';
import '../../core/widgets/app_text_field.dart';
import '../../core/widgets/top_blue_header.dart';
import '../../di/injection.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  bool obscurePassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> handleLogin() async {
    FocusScope.of(context).unfocus();

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showSnack('Please enter email and password');
      return;
    }

    setState(() => loading = true);

    try {
      await authRepository.login(email: email, password: password);

      final user = authRepository.currentUser;

      if (user == null) {
        throw Exception('Login failed');
      }

      final appUser = await userRepository.getUserByUid(user.uid);

      if (!mounted) return;

      if (appUser == null) {
        throw Exception('User profile not found in Firestore');
      }

      switch (appUser.role) {
        case 'student':
          context.go(RouteNames.studentShell);
          break;
        case 'parent':
          context.go(RouteNames.parentShell);
          break;
        case 'teacher':
          context.go(RouteNames.teacherShell);
          break;
        case 'admin':
          context.go(RouteNames.adminShell);
          break;
        default:
          throw Exception('Unknown user role');
      }
    } catch (e) {
      if (!mounted) return;
      _showSnack('Login failed. Check email, password, and Firestore role.');
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          TopBlueHeader(
            height: 255,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 84,
                  height: 84,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.16),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const Icon(
                    Icons.school_rounded,
                    size: 42,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Smart Edu',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'School Management System',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8EBC2),
                      border: Border.all(color: const Color(0xFFE4B03A)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Login to continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFCB5F3C),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  AppTextField(
                    label: 'Email Address',
                    hintText: 'example@email.com',
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 18),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      AppTextField(
                        label: 'Password',
                        hintText: '••••••••',
                        obscureText: obscurePassword,
                        controller: passwordController,
                      ),
                      Positioned(
                        right: 14,
                        bottom: 18,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                          child: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.mutedText,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.go(RouteNames.forgotPassword),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AppButton(
                    text: loading ? 'Signing in...' : 'Sign in',
                    onTap: loading ? null : handleLogin,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

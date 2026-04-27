import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/route_names.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  bool loading = false;

  Future<void> resetPassword() async {
    FocusScope.of(context).unfocus();

    final email = emailController.text.trim();

    if (email.isEmpty) {
      _showSnack('Please enter your email');
      return;
    }

    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    setState(() => loading = false);

    _showSnack('Password reset link sent to $email');
  }

  void _showSnack(String text) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(text)));
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                IconButton(
                  onPressed: () => context.go(RouteNames.login),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),

                const SizedBox(height: 12),

                const Text(
                  'Forgot Password',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
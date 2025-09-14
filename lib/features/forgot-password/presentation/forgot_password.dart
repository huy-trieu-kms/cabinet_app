import 'package:flutter/material.dart';

/// A page that provides the UI for users to reset their forgotten password.
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Forgot Password Page'));
  }
}

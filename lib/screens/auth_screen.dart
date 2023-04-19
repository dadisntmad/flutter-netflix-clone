import 'package:flutter/material.dart';
import 'package:netflix_clone/constants/custom_colors.dart';
import 'package:netflix_clone/view_models/auth_viewmodel.dart';
import 'package:netflix_clone/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<AuthViewModel>();
    final isLoading = context.select((AuthViewModel model) => model.isLoading);
    final errorText =
        context.select((AuthViewModel model) => model.errorMessage);

    return Scaffold(
      backgroundColor: secondaryBackground,
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: 120,
          width: 120,
          fit: BoxFit.contain,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                controller: _usernameController,
                hintText: 'Username',
                errorText: errorText,
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                isPassword: true,
                errorText: errorText,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: accentRed),
                  onPressed: isLoading
                      ? null
                      : () => model.login(
                            context: context,
                            username: _usernameController.text,
                            password: _passwordController.text,
                          ),
                  child: isLoading
                      ? const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

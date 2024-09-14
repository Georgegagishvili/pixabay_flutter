import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  context.theme.primary,
                  BlendMode.srcIn,
                ),
                child: Image.network(
                  'https://i.imgur.com/ONsT7xf.png',
                  width: 40,
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(flex: 2),
              const Text(
                'Sign In',
                style: AppTextStyles.twentyEightW700,
              ),
              Text(
                'Welcome back, enter your credentials to continue',
                style: AppTextStyles.fourteenW400.copyWith(),
              ),
              const SizedBox(height: 26),
              DefaultTextField(
                label: 'Email',
                hint: 'Enter your email',
                validator: _validateEmail,
                autofocus: true,
                // onChanged: _resetValidators,
                textInputAction: TextInputAction.next,
                controller: _emailController,
              ),
              const SizedBox(height: 16),
              DefaultTextField(
                label: 'Password',
                hint: 'Enter your password',
                obscureText: true,
                validator: _validatePassword,
                maxLength: 12,
                controller: _passwordController,
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Create an account',
                    style: AppTextStyles.fourteenW400,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              BlocBuilder<LoginCubit, ApiResource<String>>(
                bloc: context.read<LoginCubit>(),
                builder: (context, ApiResource<String> state) {
                  return DefaultButton(
                    label: 'Sign In',
                    onTap: _onContinue,
                    loading: state.status == ApiStatus.loading,
                  );
                },
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!value.isEmail) {
      return 'Invalid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    final length = value.length;
    if (length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  Future<void> _onContinue() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;
      final payload = LoginPayload(
        username: email,
        password: password,
      );

      final ApiResource<String> loginResult =
          await context.read<LoginCubit>().login(payload);

      if (!mounted) return;
      if (loginResult.message == CustomExceptions.INVALID_CREDENTIALS) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('User not found'),
          backgroundColor: context.theme.error,
        ));
      }
      if (loginResult.data == null) return;

      Preferences.instance.setString(
        PreferenceKeys.USER_TOKEN,
        loginResult.data,
      );

      context.push(
        const HomePage(),
      );
    }
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

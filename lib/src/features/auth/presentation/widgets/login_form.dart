import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class _LoginFormState extends State<LoginForm> with Validator {
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
    return Form(
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
            child: Image.asset(
              PngAsset.logo,
              width: 40,
              alignment: Alignment.centerLeft,
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(flex: 2),
          const TitleText(
            title: 'Sign In',
            text: 'Welcome back, enter your credentials to continue',
          ),
          const SizedBox(height: 26),
          DefaultTextField(
            label: 'Email',
            hint: 'Enter your email',
            validator: validateEmail,
            autofocus: true,
            // onChanged: _resetValidators,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          const SizedBox(height: 16),
          DefaultTextField(
            label: 'Password',
            hint: 'Enter your password',
            obscureText: true,
            validator: validatePassword,
            maxLength: 12,
            controller: _passwordController,
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: _onCreateAccount,
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
    );
  }

  void _onCreateAccount() {
    context.push(const SignUpPage());
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
        context.showSnackBar(
          'User not found',
          isError: true,
        );
      }
      if (loginResult.data == null) return;

      context.pushAndRemoveUntil(
        const HomePage(),
      );
    }
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class _SignUpPageState extends State<SignUpPage> with Validator {
  int? _age;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: defaultAllPaddingWithStackedButton,
              children: [
                const TitleText(
                  title: 'Sign Up',
                  text: 'Create an account to continue',
                ),
                const SizedBox(height: 26),
                DefaultTextField(
                  label: 'Email',
                  hint: 'Enter your email',
                  controller: _emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                DefaultTextField(
                  label: 'Full Name',
                  hint: 'Enter your full name',
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                  ],
                  validator: validateEmptyField,
                  controller: _fullNameController,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                DateTextField(
                  label: 'Age',
                  hint: 'Enter your age',
                  validator: validateEmptyField,
                  onChanged: _onBirthDateChanged,
                ),
                const SizedBox(height: 16),
                DefaultTextField(
                  label: 'Password',
                  hint: 'Enter your password',
                  controller: _passwordController,
                  validator: validatePassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
                DefaultTextField(
                  label: 'Confirm Password',
                  hint: 'Re-enter your password',
                  controller: _confirmPasswordController,
                  validator: (v) => validateConfirmPassword(
                    v,
                    _passwordController.text,
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 24,
            child: BlocBuilder<RegisterCubit, ApiResource<String?>>(
              bloc: context.read<RegisterCubit>(),
              builder: (context, ApiResource<String?> state) {
                return DefaultButton(
                  label: 'Sign Up',
                  onTap: _onSignUp,
                  loading: state.status == ApiStatus.loading,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onBirthDateChanged(DateTime? date) {
    if (date == null) return;

    final DateTime now = DateTime.now();
    _age = now.year - date.year;
  }

  Future<void> _onSignUp() async {
    if (_formKey.currentState!.validate()) {
      final RegisterPayload payload = RegisterPayload(
        email: _emailController.text,
        password: _passwordController.text,
        fullName: _fullNameController.text,
        age: _age!,
      );
      final ApiResource<String> signUpResult =
          await context.read<RegisterCubit>().signUp(payload);

      if (!mounted) return;
      if (signUpResult.message == CustomExceptions.USER_ALREADY_EXISTS) {
        context.showSnackBar(
          'User already exists',
          isError: true,
        );
        return;
      }

      context.read<LoginCubit>().setUserToken(signUpResult.data!);

      context.pushAndRemoveUntil(const HomePage());
    }
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

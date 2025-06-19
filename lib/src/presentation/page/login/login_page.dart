import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/enum.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/commons/navigate_handle.dart';
import 'package:panel_apk/src/commons/shared_pref.dart';
import 'package:panel_apk/src/config/route_config.dart';
import 'package:panel_apk/src/config/size_config.dart';
import 'package:panel_apk/src/presentation/widget/button.dart';
import 'package:panel_apk/src/presentation/widget/snackbar.dart';
import 'package:panel_apk/src/presentation/widget/textfield.dart';

import '../../bloc/login/login_bloc.dart';
import '../../widget/loading_circle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isShowPassword = true;
  bool _isEmailError = false;
  bool _isPasswordError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: Appsize.symetric(vertical: 10, horizontal: 30),
          width: Appsize.width(context) / 3,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: Appsize.symetric(vertical: 30),
                child: Text("Login", style: context.styleText.displayLarge),
              ),
              AppTextfield(
                controller: _emailController,
                preffixIcon: const Icon(Icons.email),
                hintText: "Masukkan Email",
                isError: _isEmailError,
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    setState(() {
                      _isEmailError = false;
                    });
                  }
                },
              ),
              AppTextfield(
                controller: _passwordController,
                preffixIcon: const Icon(Icons.key),
                hintText: "******",
                isError: _isPasswordError,
                onChanged: (p0) {
                  if (p0.isNotEmpty) {
                    setState(() {
                      _isPasswordError = false;
                    });
                  }
                },
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isShowPassword = !_isShowPassword;
                      });
                    },
                    icon: Icon(_isShowPassword ? Icons.visibility_off : Icons.visibility)),
                obscureText: _isShowPassword,
              ),
              const SizedBox(height: 10),
              BlocConsumer<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    AppSharedPref.setToken(state.login.data);
                    appSnackbar(context, message: state.login.message, onClose: () {
                      NavigateHandle.byTypeRoute(
                        context: context,
                        typeRoute: TypeRoute.removeUntil,
                        path: AppRoute.dashboard,
                      );
                    });
                  }
                  if (state is LoginError) {
                    return appSnackbar(context, message: state.message);
                  }
                },
                builder: (context, state) {
                  if (state is LoginLoading) {
                    return const AppLoading();
                  }
                  if (state is LoginError) {
                    return Column(
                      children: [
                        AppButton(
                          widget: const Text("Masuk"),
                          onPressed: _onSubmit,
                          width: 200,
                        ),
                        const SizedBox(height: 20),
                        Text(state.message,
                            style: context.styleText.bodySmall!.copyWith(color: context.colorSchema.secondary)),
                      ],
                    );
                  }
                  if (state is LoginLoading) {
                    return AppButton(
                      widget: const Text("Masuk"),
                      onPressed: _onSubmit,
                      width: 200,
                    );
                  }
                  return AppButton(
                    widget: const Text("Masuk"),
                    onPressed: _onSubmit,
                    width: 200,
                  );
                },
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.push, path: AppRoute.register);
                },
                child: Text(
                  "Daftar",
                  style: context.styleText.bodySmall,
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    final username = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      setState(() {
        _isEmailError = username.isEmpty;
        _isPasswordError = password.isEmpty;
      });
    } else {
      context.read<LoginBloc>().add(LoadLogin(username: username, password: password));
    }
  }
}

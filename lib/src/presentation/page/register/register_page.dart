import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/src/commons/extension.dart';
import 'package:panel_apk/src/presentation/bloc/register/register_bloc.dart';
import 'package:panel_apk/src/presentation/widget/snackbar.dart';

import '../../../commons/enum.dart';
import '../../../commons/navigate_handle.dart';
import '../../../config/route_config.dart';
import '../../../config/size_config.dart';
import '../../widget/button.dart';
import '../../widget/loading_circle.dart';
import '../../widget/textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isShowPassword = true;
  bool _isShowConfirmPassword = true;
  bool _isErrorUsername = false;
  bool _isErrorEmail = false;
  bool _isErrorFullname = false;
  bool _isErrorPassword = false;
  bool _isErrorConfirmPassword = false;
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _fullnameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorSchema.surface,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: Appsize.symetric(vertical: 10, horizontal: 30),
              width: Appsize.width(context) / 3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: Appsize.symetric(vertical: 30),
                    child: Text("Register", style: context.styleText.displayLarge),
                  ),
                  AppTextfield(
                    controller: _usernameController,
                    preffixIcon: const Icon(Icons.person),
                    hintText: "Masukkan Username",
                    isError: _isErrorUsername,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        setState(() {
                          _isErrorUsername = false;
                        });
                      }
                    },
                  ),
                  AppTextfield(
                    controller: _emailController,
                    preffixIcon: const Icon(Icons.email),
                    hintText: "Masukkan Email",
                    isError: _isErrorEmail,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        setState(() {
                          _isErrorEmail = false;
                        });
                      }
                    },
                  ),
                  AppTextfield(
                    controller: _fullnameController,
                    preffixIcon: const Icon(Icons.person_2),
                    hintText: "Masukkan Full Name",
                    isError: _isErrorFullname,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        setState(() {
                          _isErrorFullname = false;
                        });
                      }
                    },
                  ),
                  AppTextfield(
                    controller: _passwordController,
                    preffixIcon: const Icon(Icons.key),
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isShowPassword = !_isShowPassword;
                          });
                        },
                        icon: Icon(_isShowPassword ? Icons.visibility_off : Icons.visibility)),
                    obscureText: _isShowPassword,
                    isError: _isErrorPassword,
                    errorMessage: _errorMessage,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        setState(() {
                          _isErrorPassword = false;
                        });
                      }
                    },
                  ),
                  AppTextfield(
                    controller: _confirmPasswordController,
                    preffixIcon: const Icon(Icons.key),
                    hintText: "Confirm Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isShowConfirmPassword = !_isShowConfirmPassword;
                          });
                        },
                        icon: Icon(_isShowConfirmPassword ? Icons.visibility_off : Icons.visibility)),
                    obscureText: _isShowConfirmPassword,
                    isError: _isErrorConfirmPassword,
                    errorMessage: _errorMessage,
                    onChanged: (p0) {
                      if (p0.isNotEmpty) {
                        setState(() {
                          _isErrorConfirmPassword = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterSuccess) {
                        appSnackbar(
                          context,
                          message: state.registerResponeEntity.message,
                          onClose: () => NavigateHandle.byTypeRoute(
                              context: context, typeRoute: TypeRoute.push, path: AppRoute.login),
                        );
                      }
                      if (state is RegisterFailed) {
                        return appSnackbar(context, message: state.msgError);
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return const AppLoading();
                      }
                      if (state is RegisterFailed) {
                        return AppButton(
                          widget: const Text("Daftar"),
                          width: 200,
                          onPressed: _onSubmit,
                        );
                      }
                      if (state is RegisterSuccess) {
                        return AppButton(
                          widget: const Text("Daftar"),
                          width: 200,
                          onPressed: _onSubmit,
                        );
                      }
                      return AppButton(
                        widget: const Text("Daftar"),
                        width: 200,
                        onPressed: _onSubmit,
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () {
                      NavigateHandle.byTypeRoute(context: context, typeRoute: TypeRoute.push, path: AppRoute.login);
                    },
                    child: Text(
                      "Masuk sebagai pengguna",
                      style: context.styleText.labelSmall,
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onSubmit() {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final fullname = _fullnameController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (username.isEmpty || email.isEmpty || fullname.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        _isErrorUsername = username.isEmpty;
        _isErrorEmail = email.isEmpty;
        _isErrorFullname = fullname.isEmpty;
        _isErrorPassword = password.isEmpty;
        _isErrorConfirmPassword = confirmPassword.isEmpty;
        _errorMessage = "Data tidak Boleh Kosong";
      });
    } else if (password != confirmPassword) {
      setState(() {
        _isErrorPassword = true;
        _isErrorConfirmPassword = true;
        _errorMessage = "Password tidak cocok";
      });
    } else {
      context
          .read<RegisterBloc>()
          .add(LoadRegister(username: username, email: email, fullname: fullname, password: password));
    }
  }
}

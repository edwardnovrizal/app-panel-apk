import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panel_apk/router.dart';
import 'package:panel_apk/src/commons/http_override.dart';
import 'package:panel_apk/src/presentation/bloc/project/project_bloc.dart';
import 'package:panel_apk/src/presentation/bloc/register/register_bloc.dart';
import 'injection.dart' as di;
import 'src/commons/shared_pref.dart';
import 'src/config/route_config.dart';
import 'src/config/theme_config.dart';
import 'src/presentation/bloc/login/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  di.init();
  await AppSharedPref.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(create: (context) => di.locator<RegisterBloc>()),
        BlocProvider<LoginBloc>(create: (context) => di.locator<LoginBloc>()),
        BlocProvider<ProjectBloc>(create: (context) => di.locator<ProjectBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Panel APK",
        initialRoute: AppRoute.auth,
        onGenerateRoute: (settings) => RouterGenerate.build(settings),
        theme: AppTheme.light,
      ),
    );
  }
}

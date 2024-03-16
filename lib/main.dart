import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/cubit/user_cubit.dart';
import 'package:api_app_project/screens/logIn_screen.dart';
import 'package:api_app_project/screens/signUp_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // CacheHelper().init();
  runApp(BlocProvider(
      create: (BuildContext context) => UserCubit(DioConsumer(Dio())),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LogInScreen(),
    );
  }
}

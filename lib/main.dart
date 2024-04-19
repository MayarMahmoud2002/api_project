import 'package:api_app_project/core/api/api_consumer.dart';
import 'package:api_app_project/core/api/dio_consumer.dart';
import 'package:api_app_project/cubit/user_cubit.dart';
import 'package:api_app_project/repositories/user_repository.dart';
import 'package:api_app_project/screens/profile_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cache/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();

  runApp(BlocProvider(
      create: (BuildContext context) =>
          UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
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
      home: ProfileScreen(),
    );
  }
}

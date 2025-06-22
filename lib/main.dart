import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_new_app/core/api/dio_consumer.dart';
import 'package:my_new_app/core/cache/cache_helper.dart';
import 'package:my_new_app/cubit/user_cubit.dart';
import 'package:my_new_app/repositories/user_repository.dart';
import 'package:my_new_app/screens/signin_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  await ScreenUtil.ensureScreenSize();
  runApp(
    BlocProvider(
      create: (context) => UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => UserCubit(UserRepository(api: DioConsumer(dio: Dio()))),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',

            theme: ThemeData(
              fontFamily: "Cairo",
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            home: SignInScreen(),
          ),
        );
      },
    );
  }
}

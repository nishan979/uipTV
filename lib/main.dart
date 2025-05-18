import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uip_tv/controllers/home_controller.dart';
import 'package:uip_tv/utils/colors.dart';
import 'package:uip_tv/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UIP TV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
        ),
      ),
      home: const HomeView(),
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    );
  }
}
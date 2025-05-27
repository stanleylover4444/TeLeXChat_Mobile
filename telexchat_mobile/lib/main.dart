import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TelexChat Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}

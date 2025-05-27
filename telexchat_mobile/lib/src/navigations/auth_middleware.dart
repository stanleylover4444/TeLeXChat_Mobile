import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    // final isLoggedIn = false;

    // if (!isLoggedIn &&
    //     route != AppRoutes.welcome &&
    //     route != AppRoutes.login &&
    //     route != AppRoutes.register &&
    //     route != AppRoutes.forgotPassword &&
    //     route != AppRoutes.verifyOtpView &&
    //     route != AppRoutes.resetPassword) {
    //   return const RouteSettings(name: AppRoutes.login);
    // }

    return null;
  }
}

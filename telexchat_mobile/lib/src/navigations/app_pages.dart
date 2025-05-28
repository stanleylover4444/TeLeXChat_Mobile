import 'package:get/get.dart';

import 'package:telexchat_mobile/src/views/profile_view.dart';
import 'package:telexchat_mobile/src/views/setting_view.dart';
import 'package:telexchat_mobile/src/navigations/main_tab_view.dart';
import 'package:telexchat_mobile/src/views/new_feature_view.dart';

import 'package:telexchat_mobile/src/views/auth/login_view.dart';
import 'package:telexchat_mobile/src/views/auth/register_view.dart';
import 'package:telexchat_mobile/src/views/auth/reset_password_view.dart';
import 'package:telexchat_mobile/src/views/auth/wellcome_view.dart';
import 'package:telexchat_mobile/src/views/auth/forgot_password_phone_view.dart';
import 'package:telexchat_mobile/src/views/auth/verify_reset_otp_view.dart';

class AppRoutes {
  // OUTSIDE (Unauthenticated routes)
  static const welcome = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgotPassword';
  static const verifyOtpView = '/verifyOtpView';
  static const resetPassword = '/resetPassword';

  // INSIDE (Authenticated routes)
  static const setting = '/setting';
  static const profile = '/profile';
  static const mainTab = '/mainTab';
  static const newFeature = '/newFeature';

  static final routes = [
    // OUTSIDE
    GetPage(name: welcome, page: () => const WellcomeView()),
    GetPage(name: login, page: () => LoginView()),
    GetPage(name: register, page: () => RegisterView()),
    GetPage(name: forgotPassword, page: () => const ForgotPasswordPhoneView()),
    GetPage(name: verifyOtpView, page: () => const VerifyResetOtpView()),
    GetPage(name: resetPassword, page: () => const ResetPasswordView()),

    // INSIDE
    GetPage(name: mainTab, page: () => const MainTabView()),
    GetPage(name: setting, page: () => const SettingView()),
    GetPage(name: profile, page: () => const ProfileView()),
    GetPage(name: newFeature, page: () => const NewFeatureView()),

    // Example middleware usage (commented out)
    // GetPage(name: home, page: () => const HomeView(), middlewares: [AuthMiddleware()]),
  ];
}

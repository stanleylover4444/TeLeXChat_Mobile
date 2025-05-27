import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/main_tab_view.dart';
import 'package:telexchat_mobile/src/pages/auth/forgot_password_phone_view.dart';
import 'package:telexchat_mobile/src/pages/auth/login_view.dart';
import 'package:telexchat_mobile/src/pages/auth/register_view.dart';
import 'package:telexchat_mobile/src/pages/auth/reset_password_view.dart';
import 'package:telexchat_mobile/src/pages/auth/verify_reset_otp_view.dart';
import 'package:telexchat_mobile/src/pages/auth/wellcome_view.dart';
import 'package:telexchat_mobile/src/pages/home/new_feature_view.dart';

class AppRoutes {
  // OUTSIDE
  static const welcome = '/';
  static const login = '/login';
  static const register = '/register';
  static const forgotPassword = '/forgotPassword';
  static const verifyOtpView = '/verifyOtpView';
  static const resetPassword = '/resetPassword';

  // INSIDE
  static const mainTab = '/mainTab';
  static const newFeature = '/newFeature';

  static final routes = [
    // OUTSIDE
    GetPage(
      name: welcome,
      page: () => const WellcomeView(),
      //  middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: login,
      page: () => const LoginView(),
      //  middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: register,
      page: () => const RegisterView(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordPhoneView(),
      //middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: verifyOtpView,
      page: () => const VerifyResetOtpView(),
      // middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: resetPassword,
      page: () => const ResetPasswordView(),

      ///middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: mainTab,
      page: () => const MainTabView(),
      // middlewares: [AuthMiddleware()],
    ),

    GetPage(name: newFeature, page: () => const NewFeatureView()),

    // INSIDE
    // GetPage(name: home, page: () => const HomeView(), middlewares: [AuthMiddleware()]),
  ];
}

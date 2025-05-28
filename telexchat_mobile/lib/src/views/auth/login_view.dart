import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_event.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider.value(
        value: Get.find<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Get.offAllNamed(AppRoutes.mainTab);
            } else if (state is AuthError) {
              Get.snackbar(
                'Lỗi đăng nhập',
                state.message,
                snackPosition: SnackPosition.BOTTOM,
              );
            }
          },
          child: WidgetScaffold(
            appBar: WidgetAppbar(title: "Đăng nhập", isBack: false),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Số điện thoại",
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Mật khẩu",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.forgotPassword),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Quên mật khẩu?",
                          style: DefaultStyles.regular12Black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CircularProgressIndicator();
                      }
                      return WidgetButton(
                        title: "Đăng nhập",
                        padding: EdgeInsets.symmetric(vertical: 10),
                        onPressed: () {
                          final phone = phoneController.text.trim();
                          final password = passwordController.text.trim();
                          if (phone.isEmpty || password.isEmpty) {
                            Get.snackbar(
                              'Lỗi',
                              'Vui lòng nhập đủ số điện thoại và mật khẩu',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            return;
                          }
                          context.read<AuthBloc>().add(
                            LoginRequested(phone, password),
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Bạn chưa có tài khoản?",
                        style: DefaultStyles.regular14Black,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.register),
                        child: Text(
                          "Đăng ký",
                          style: DefaultStyles.regular14Black.copyWith(
                            color: AppColors.primary700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

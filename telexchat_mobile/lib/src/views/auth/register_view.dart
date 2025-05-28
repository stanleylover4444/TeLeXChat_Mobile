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

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: BlocProvider.value(
        value: Get.find<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthRegistered) {
              Get.snackbar(
                'Thành công',
                'Đăng ký thành công! Vui lòng đăng nhập.',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              Get.offNamed(AppRoutes.login);
            } else if (state is AuthError) {
              Get.snackbar(
                'Lỗi đăng ký',
                state.message,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          child: WidgetScaffold(
            appBar: WidgetAppbar(title: "Đăng ký", isBack: true),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Họ và tên *",
                    keyboardType: TextInputType.name,
                    controller: fullNameController,
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Số điện thoại *",
                    keyboardType: TextInputType.phone,
                    controller: phoneNumberController,
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Mật khẩu *",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  SizedBox(height: 16),
                  CustomTextInput(
                    label: "Nhập lại mật khẩu *",
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    controller: rePasswordController,
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Bằng việc đăng ký, bạn đồng ý với các",
                    style: DefaultStyles.regular12Black,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Text(
                      "Điều khoản và Quy định chung",
                      style: DefaultStyles.regular12Black.copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primary700,
                        color: AppColors.primary700,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CircularProgressIndicator();
                      }
                      return WidgetButton(
                        title: "Đăng ký",
                        padding: EdgeInsets.symmetric(vertical: 10),
                        onPressed: () {
                          final fullName = fullNameController.text.trim();
                          final phone = phoneNumberController.text.trim();
                          final password = passwordController.text.trim();
                          final rePassword = rePasswordController.text.trim();

                          // Validation
                          if (fullName.isEmpty ||
                              phone.isEmpty ||
                              password.isEmpty ||
                              rePassword.isEmpty) {
                            Get.snackbar(
                              'Lỗi',
                              'Vui lòng nhập đầy đủ thông tin',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (password != rePassword) {
                            Get.snackbar(
                              'Lỗi',
                              'Mật khẩu không khớp',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          if (password.length < 6) {
                            Get.snackbar(
                              'Lỗi',
                              'Mật khẩu phải có ít nhất 6 ký tự',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                            return;
                          }

                          // Gửi event đăng ký
                          context.read<AuthBloc>().add(
                            RegisterRequested(phone, password, fullName),
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
                        "Bạn đã có tài khoản?",
                        style: DefaultStyles.regular14Black,
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          "Đăng nhập",
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

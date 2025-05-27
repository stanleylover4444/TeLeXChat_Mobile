import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WidgetScaffold(
        appBar: WidgetAppbar(title: "", isBack: true),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            Text(
                              "Tạo mật khẩu mới",
                              style: DefaultStyles.bold18Black,
                            ),

                            Text(
                              "Nhập mật khẩu mới cho tài khoản của bạn.",
                              style: DefaultStyles.medium12Black,
                            ),
                            const SizedBox(height: 24),
                            CustomTextInput(
                              label: "Mật khẩu mới",
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 16),
                            CustomTextInput(
                              label: "Xác nhận mật khẩu",
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 32),
                            WidgetButton(
                              title: "Xác nhận",
                              onPressed: () {
                                // Điều hướng sang màn hình đăng nhập hoặc trang chủ
                                Get.offAllNamed(AppRoutes.login);
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

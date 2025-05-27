import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
              ),

              SizedBox(height: 16),
              CustomTextInput(
                label: "Mật khẩu",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 5),

              GestureDetector(
                onTap: () => {Get.toNamed(AppRoutes.forgotPassword)},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Quên mật khẩu?", style: DefaultStyles.regular12Black),
                  ],
                ),
              ),
              SizedBox(height: 16),
              WidgetButton(
                title: "Đăng nhập",
                padding: EdgeInsets.symmetric(vertical: 10),
                onPressed: () {
                  Get.offAllNamed(AppRoutes.mainTab);
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
                    onTap: () {
                      Get.toNamed(AppRoutes.register);
                    },
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
    );
  }
}

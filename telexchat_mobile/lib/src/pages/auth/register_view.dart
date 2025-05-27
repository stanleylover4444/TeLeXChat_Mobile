import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
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
              ),

              SizedBox(height: 16),
              CustomTextInput(
                label: "Số điện thoại *",

                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: 16),
              CustomTextInput(
                label: "Mật khẩu *",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
              ),

              SizedBox(height: 16),
              CustomTextInput(
                label: "Nhập lại mật khẩu *",
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
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
              WidgetButton(
                title: "Đăng ký",
                padding: EdgeInsets.symmetric(vertical: 10),
                onPressed: () {
                  // Get.toNamed(AppRoutes.register);
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
    );
  }
}

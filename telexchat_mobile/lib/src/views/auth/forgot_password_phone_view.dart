import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';

class ForgotPasswordPhoneView extends StatelessWidget {
  const ForgotPasswordPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WidgetScaffold(
        appBar: WidgetAppbar(title: "", isBack: true),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text("Quên mật khẩu", style: DefaultStyles.bold18Black),

              Text(
                "Vui lòng nhập số điện thoại của bạn!",
                style: DefaultStyles.medium12Black,
              ),
              SizedBox(height: 16),
              CustomTextInput(
                label: "Số điện thoại",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 4),
              Center(
                child: Text(
                  "Chúng tôi sẽ gửi mã xác nhận đến số điện thoại của bạn.",
                  textAlign: TextAlign.center,
                  style: DefaultStyles.medium12Gray,
                ),
              ),
              SizedBox(height: 24),
              WidgetButton(
                title: "Tiếp tục",
                onPressed: () {
                  Get.toNamed(AppRoutes.verifyOtpView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

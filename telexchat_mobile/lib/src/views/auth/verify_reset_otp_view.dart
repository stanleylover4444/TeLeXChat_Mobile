import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';


class VerifyResetOtpView extends StatelessWidget {
  const VerifyResetOtpView({super.key});

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
                              "Nhập mã xác nhận",
                              style: DefaultStyles.bold18Black,
                            ),

                            Text(
                              "Chúng tôi đã gửi mã OTP đến số điện thoại của bạn.",
                              style: DefaultStyles.medium12Black,
                            ),
                            const SizedBox(height: 40),
                            Center(
                              child: OtpTextField(
                                numberOfFields: 4,

                                focusedBorderColor: AppColors.primary,
                                showFieldAsBox: false,
                                styles: List.generate(
                                  4,
                                  (_) => DefaultStyles.bold18Black.copyWith(
                                    color: AppColors.primary700,
                                  ),
                                ),
                                onCodeChanged: (String code) {
                                  print("OTP nhập: $code");
                                },
                              ),
                            ),
                            const SizedBox(height: 30),
                            Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Bạn chưa nhận được mã?",
                                    style: DefaultStyles.regular14Black,
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () {
                                      print("Gửi lại mã");
                                    },
                                    child: Text(
                                      "Gửi lại mã",
                                      style: DefaultStyles.regular14Black
                                          .copyWith(
                                            color: AppColors.primary700,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(height: 32),
                            WidgetButton(
                              title: "Xác nhận",
                              onPressed: () {
                                Get.toNamed(AppRoutes.resetPassword);
                              },
                            ),
                            const SizedBox(height: 10),
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

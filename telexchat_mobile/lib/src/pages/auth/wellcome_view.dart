import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';

class WellcomeView extends StatelessWidget {
  const WellcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return WidgetScaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenWidth * 0.1),
                    Text("Welcome to TeleX", style: DefaultStyles.bold22Black),
                    const SizedBox(height: 12),
                    Container(
                      width: screenWidth * 0.8,
                      child: Text(
                        "You need to create your account in order to save your data on cloud.",
                        style: DefaultStyles.regular14Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: WidgetButton(
                        title: "Create Account",
                        onPressed: () {
                          Get.toNamed(AppRoutes.register);
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: DefaultStyles.regular14Black,
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text(
                            "Sign In",
                            style: DefaultStyles.regular14Black.copyWith(
                              color: AppColors.primary700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:telexchat_mobile/src/pages/home/message_view.dart';
import 'package:telexchat_mobile/src/pages/home/notification_view.dart';
import 'package:telexchat_mobile/src/pages/home/setting_view.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key}) : super(key: key);

  @override
  _MainTabViewState createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int currentIndex = 0;

  final List<IconData> icons = [
    Icons.message_rounded,
    Icons.notifications,
    Icons.settings,
  ];

  final List<String> labels = ['Tin nhắn', 'Thông Báo', 'Cá nhân'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomBar(
        width: MediaQuery.of(context).size.width * 0.9,
        borderRadius: BorderRadius.circular(8),
        hideOnScroll: true,
        barDecoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 16,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        barColor: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.075,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              final isSelected = index == currentIndex;
              return GestureDetector(
                onTap: () => setState(() => currentIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color: isSelected ? AppColors.primary : AppColors.gray,
                      size: 24,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      labels[index],
                      style: DefaultStyles.medium12Black.copyWith(
                        color: isSelected ? AppColors.primary700 : Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
        body: (context, controller) {
          final pages = [
            MessageView(controller: controller),
            NotificationView(),
            SettingView(),
          ];
          return pages[currentIndex];
        },
      ),
    );
  }
}

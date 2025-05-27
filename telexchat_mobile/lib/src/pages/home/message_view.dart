import 'package:flutter/material.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';

class MessageView extends StatelessWidget {
  final ScrollController controller;
  const MessageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return WidgetScaffold(
      appBar: WidgetAppbar(title: "Tin nhắn", isBack: true),
      body: ListView.builder(
        controller: controller,
        padding: const EdgeInsets.all(12),
        itemCount: 30,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                "Dòng tin nhắn số ${index + 1}",
                style: DefaultStyles.regular14Black,
              ),
            ),
          );
        },
      ),
    );
  }
}

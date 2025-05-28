import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/views/components/avate_picker.dart';
import 'package:telexchat_mobile/src/views/components/widget_category_toggle.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    final authBloc = Get.find<AuthBloc>();

    return WidgetScaffold(
      appBar: WidgetAppbar(title: "", isBack: true),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              AvatarPicker(
                imageUrl:
                    "https://up.gc-img.net/post_img_web/2025/05/MYLIFxvIS6LoWLx_4511_s.jpeg",
                onPressed: () {
                  print("Chọn lại ảnh");
                },
              ),
              SizedBox(height: 16),
              if (state is AuthAuthenticated)
                Center(
                  child: Text(
                    "${state.user.fullName}",
                    style: DefaultStyles.bold24Black,
                  ),
                ),
              SizedBox(height: 24),

              WidgetCategoryToggle(
                icon: Icons.toggle_on,
                title: "Trạng thái hoạt động",
                value: isActive,
                onChanged: (newValue) {
                  setState(() {
                    isActive = newValue;
                  });
                  print("Trạng thái mới: $newValue");
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

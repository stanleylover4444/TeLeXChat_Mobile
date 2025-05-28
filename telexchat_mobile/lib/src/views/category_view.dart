import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_event.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/styles/colors.dart';
import 'package:telexchat_mobile/src/styles/defaultstyles.dart';
import 'package:telexchat_mobile/src/widgets/widget_category.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = Get.find<AuthBloc>();

    return WidgetScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Danh mục", style: DefaultStyles.bold24Black),
            const Icon(Icons.qr_code),
          ],
        ),
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                WidgetCategory(
                  icon: Icons.settings,
                  title: 'Cài đặt',
                  onTap: () {
                    Get.toNamed(AppRoutes.setting);
                  },
                ),
                WidgetCategory(
                  icon: Icons.person,
                  title: 'Thông tin cá nhân',
                  onTap: () {
                    Get.toNamed(AppRoutes.profile);
                  },
                ),
                WidgetCategory(
                  icon: Icons.password,
                  title: 'Đổi mật khẩu',
                  onTap: () {},
                ),
                WidgetCategory(
                  icon: Icons.people,
                  title: 'Lời mời kết bạn',
                  onTap: () {
                    print('Cài đặt tapped');
                  },
                ),
                WidgetCategory(
                  icon: Icons.gif_box_outlined,
                  title: 'Tin nhắn chờ',
                  onTap: () {
                    print('Cài đặt tapped');
                  },
                ),
                WidgetCategory(
                  icon: Icons.logout,
                  title: 'Đăng xuất',
                  onTap: () {
                    final authBloc = Get.find<AuthBloc>();
                    print("Is AuthBloc closed? ${authBloc.isClosed}");
                    if (!authBloc.isClosed) {
                      authBloc.add(LogoutRequested());
                    } else {
                      print("AuthBloc đã bị đóng, không thể add event");
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

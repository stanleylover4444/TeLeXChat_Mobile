import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_event.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';


class MessageView extends StatelessWidget {
  final ScrollController controller;
  const MessageView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final authBloc = Get.find<AuthBloc>();

    return WidgetScaffold(
      appBar: WidgetAppbar(
        title: "",
        isBack: false,
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Column(
            children: [
              WidgetButton(
                title: "Thông tin user",
                onPressed: () {
                  final currentState = authBloc.state;
                  print("State hiện tại: $currentState");

                  if (currentState is AuthAuthenticated) {
                    print("User đã đăng nhập: ${currentState.user}");
                  } else {
                    print("Chưa đăng nhập");
                  }
                },
              ),
              WidgetButton(
                title: "Đăng xuất",
                onPressed: () {
                  final authBloc = Get.find<AuthBloc>();
                  print("Is AuthBloc closed? ${authBloc.isClosed}");
                  if (!authBloc.isClosed) {
                    authBloc.add(LogoutRequested());
                  } else {
                    print("AuthBloc đã bị đóng, không thể add event");
                    // Có thể tạo lại bloc mới hoặc xử lý khác ở đây
                  }
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
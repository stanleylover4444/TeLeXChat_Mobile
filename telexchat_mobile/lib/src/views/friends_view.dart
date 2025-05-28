import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';


class FriendsView extends StatelessWidget {
  final ScrollController controller;
  const FriendsView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final authBloc = Get.find<AuthBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Messages')),
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
                    print("User đã đăng nhập: ${currentState}");
                  } else {
                    print("Chưa đăng nhập");
                  }
                },
              ),
              WidgetButton(
                title: "Đăng xuất",
                onPressed: () {
                  print("Đang đăng xuất...");
                  // authBloc.add(LogoutRequested());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

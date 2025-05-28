import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/blocs/user_bloc.dart';
import 'package:telexchat_mobile/src/blocs/user_even.dart';
import 'package:telexchat_mobile/src/blocs/user_state.dart';
import 'package:telexchat_mobile/src/widgets/widget_appbar.dart';
import 'package:telexchat_mobile/src/widgets/widget_button.dart';
import 'package:telexchat_mobile/src/widgets/widget_scaffold.dart';
import 'package:telexchat_mobile/src/widgets/widget_text_input.dart';


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isActive = true;
  late TextEditingController fullNameController;
  late AuthBloc authBloc;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    authBloc = Get.find<AuthBloc>();
    userBloc = Get.find<UserBloc>();

    final state = authBloc.state;
    if (state is AuthAuthenticated) {
      fullNameController.text = state.user.fullName;
    }
  }

  @override
  void dispose() {
    fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WidgetScaffold(
        appBar: WidgetAppbar(title: "", isBack: true),
        body: MultiBlocListener(
          listeners: [
            BlocListener<UserBloc, UserState>(
              bloc: userBloc,
              listener: (context, state) {
                if (state is UpdateSuccess) {
                  Get.snackbar("Thành công", "Cập nhật hồ sơ thành công!");
                } else if (state is UpdateFailure) {
                  Get.snackbar("Lỗi", state.error);
                }
              },
            ),
          ],
          child: BlocBuilder<AuthBloc, AuthState>(
            bloc: authBloc,
            builder: (context, state) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomTextInput(
                                label: "Họ và tên",
                                keyboardType: TextInputType.name,
                                controller: fullNameController,
                              ),
                              const Spacer(),
                              WidgetButton(
                                title: "Lưu",
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  if (state is AuthAuthenticated) {
                                    final fullName = fullNameController.text
                                        .trim();
                                    userBloc.add(
                                      UpdateProfile(
                                        fullName: fullName,
                                        id: state.user.id,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

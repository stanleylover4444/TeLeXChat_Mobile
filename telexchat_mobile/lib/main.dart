import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:telexchat_mobile/src/bindings/global_bindings.dart';
import 'package:telexchat_mobile/src/blocs/auth_bloc.dart';
import 'package:telexchat_mobile/src/blocs/auth_event.dart';
import 'package:telexchat_mobile/src/blocs/auth_state.dart';
import 'package:telexchat_mobile/src/views/auth/login_view.dart';
import 'package:telexchat_mobile/src/navigations/app_pages.dart';
import 'package:telexchat_mobile/src/navigations/main_tab_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'lib/src/assets/env/.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TelexChat Mobile',
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBindings(),
      getPages: AppRoutes.routes,
      home: BlocProvider<AuthBloc>(
        create: (context) => Get.find<AuthBloc>()..add(AppStarted()),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return MainTabView();
            } else if (state is AuthUnauthenticated || state is AuthInitial) {
              return LoginView();
            } else if (state is AuthError) {
              return Scaffold(
                body: Center(child: Text('Error: ${state.message}')),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

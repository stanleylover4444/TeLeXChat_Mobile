import 'auth_event.dart';
import 'auth_state.dart';
import '../repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<AppStarted>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.getUserFromToken();
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } catch (_) {
        emit(AuthUnauthenticated());
      }
    });

    on<LoginRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.login(event.phone, event.password);
        emit(AuthAuthenticated(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<RegisterRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await authRepository.register(
          event.phone,
          event.password,
          event.fullName,
        );
        emit(AuthRegistered(user));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<UpdateUser>((event, emit) {
      emit(AuthAuthenticated(event.user));
    });

    on<LogoutRequested>((event, emit) async {
      print("LogoutRequested event received");
      try {
        await authRepository.logout();
        print('Emitting AuthUnauthenticated...');
        emit(AuthUnauthenticated());
      } catch (e) {
        print('Logout failed: $e');
      }
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wow/features/domain/entities/user.dart';
import 'package:wow/features/domain/repositories/auth_repo.dart';
import 'package:wow/features/presentation/blocs/auth/auth_event.dart';
import 'package:wow/features/presentation/blocs/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository authRepository;
  late User user;
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(_login);
  }
  Future<dynamic> _login(AuthEvent event, Emitter<AuthState> emit) async {
    if(event is Login) {
      emit(AuthLoading());
      authRepository = AuthRepository();
      await authRepository.login(event.userName,event.password )
          .then((user) {
        emit(AuthLoaded(user));
        this.user = user;
      });
    }
  }
}
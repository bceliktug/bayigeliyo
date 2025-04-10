import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/login_model.dart';
import '../repositories/login_repository.dart';

// Events
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

// States
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess(this.token);
}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

// BLoC
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _loginRepository;

  LoginBloc({required LoginRepository loginRepository})
      : _loginRepository = loginRepository,
        super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());
    try {
      final response = await _loginRepository.login(
        LoginRequest(email: event.email, password: event.password),
      );
      emit(LoginSuccess(response.token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

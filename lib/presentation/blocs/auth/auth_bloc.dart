
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class AuthStarted extends AuthEvent {}

// States
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final dynamic data;
  const AuthSuccess(this.data);
  @override
  List<Object> get props => [data];
}

// BLoC - 20 years exp pattern
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthStarted>((event, emit) async {
      emit(AuthLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(AuthSuccess("Done"));
    });
  }
}

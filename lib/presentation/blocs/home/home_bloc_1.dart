
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class HomeStarted extends HomeEvent {}

// States
abstract class HomeState extends Equatable {
  @override
  List<Object> get props => [];
}
class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final dynamic data;
  const HomeSuccess(this.data);
  @override
  List<Object> get props => [data];
}

// BLoC - 20 years exp pattern
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeStarted>((event, emit) async {
      emit(HomeLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(HomeSuccess("Done"));
    });
  }
}

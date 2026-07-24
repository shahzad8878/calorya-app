
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class FoodLogEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class FoodLogStarted extends FoodLogEvent {}

// States
abstract class FoodLogState extends Equatable {
  @override
  List<Object> get props => [];
}
class FoodLogInitial extends FoodLogState {}
class FoodLogLoading extends FoodLogState {}
class FoodLogSuccess extends FoodLogState {
  final dynamic data;
  const FoodLogSuccess(this.data);
  @override
  List<Object> get props => [data];
}

// BLoC - 20 years exp pattern
class FoodLogBloc extends Bloc<FoodLogEvent, FoodLogState> {
  FoodLogBloc() : super(FoodLogInitial()) {
    on<FoodLogStarted>((event, emit) async {
      emit(FoodLogLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(FoodLogSuccess("Done"));
    });
  }
}

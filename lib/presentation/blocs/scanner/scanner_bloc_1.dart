
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class ScannerEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class ScannerStarted extends ScannerEvent {}

// States
abstract class ScannerState extends Equatable {
  @override
  List<Object> get props => [];
}
class ScannerInitial extends ScannerState {}
class ScannerLoading extends ScannerState {}
class ScannerSuccess extends ScannerState {
  final dynamic data;
  const ScannerSuccess(this.data);
  @override
  List<Object> get props => [data];
}

// BLoC - 20 years exp pattern
class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerInitial()) {
    on<ScannerStarted>((event, emit) async {
      emit(ScannerLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(ScannerSuccess("Done"));
    });
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

@lazySingleton
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncrementPressed>(_onIncrementPressed);
    on<CounterDecrementPressed>(_onDecrementPressed);
    on<CounterResetPressed>(_onResetPressed);
  }

  void _onIncrementPressed(CounterIncrementPressed event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count + 1));
  }

  void _onDecrementPressed(CounterDecrementPressed event, Emitter<CounterState> emit) {
    emit(state.copyWith(count: state.count - 1));
  }

  void _onResetPressed(CounterResetPressed event, Emitter<CounterState> emit) {
    emit(const CounterState(count: 0));
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) {
      if (state is CounterInitial) {
        emit(CounterResult(value: 1));
      } else {
        emit(CounterResult(value: (state as CounterResult).value + 1));
      }
    });
    on<DecrementEvent>((event, emit) {
      if (state is CounterInitial) {
        emit(CounterResult(value: 1));
      } else {
        emit(CounterResult(value: (state as CounterResult).value - 1));
      }
    });
  }

  
}

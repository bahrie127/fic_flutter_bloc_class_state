part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterResult extends CounterState {
  final int value;
  CounterResult({
    required this.value,
  });
}

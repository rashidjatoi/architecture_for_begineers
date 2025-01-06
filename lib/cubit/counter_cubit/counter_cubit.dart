import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/cubit/counter_cubit/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(numb: 0));

  void updateCounterValue() {
    emit(CounterState(numb: state.numb + 1));
  }

  void removeCounterValue() {
    emit(CounterState(numb: state.numb - 1));
  }

  void resetCounterValue() {
    emit(CounterState(numb: 0));
  }
}

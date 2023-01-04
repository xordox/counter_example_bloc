import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  //method#1
  // CounterBloc() : super(CounterInitial()) {
  //   on<CounterEvent>((CounterEvent event, Emitter<CounterState> emit) {
  //     if(event is IncrementEvent){
  //       emit(CounterState(counterValue: state.counterValue +1));
  //     }
  //     else if(event is DecrementEvent){
  //       emit(CounterState(counterValue: state.counterValue - 1));
  //     }
  //   });
  // }

  //method#2
  // CounterBloc():super(CounterInitial()){
  //   on<IncrementEvent>((event, emit) => emit(CounterState(counterValue: state.counterValue + 1)));
  //   on<DecrementEvent>((event, emit) => emit(CounterState(counterValue: state.counterValue - 1)));
  // }

  //method#3
  CounterBloc():super(CounterInitial()){
    on<IncrementEvent>(_mapIncrementEventToState);
    on<DecrementEvent>(_mapDecrementEventToState);
  }

//returnType can be either void or FutureOr<void>
  void _mapDecrementEventToState(event, emit) => emit(CounterState(counterValue: state.counterValue - 1));

  FutureOr<void> _mapIncrementEventToState(event, emit) => emit(CounterState(counterValue: state.counterValue + 1));
}

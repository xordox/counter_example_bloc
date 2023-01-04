import 'package:counter_example_bloc/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${state.counterValue}'),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            FloatingActionButton(
              onPressed: ()=> context.read<CounterBloc>().add(DecrementEvent()),
              child: const Icon(Icons.remove),
            ),
            const SizedBox(
              width: 20,
            ),
            FloatingActionButton(
              onPressed: ()=> context.read<CounterBloc>().add(IncrementEvent()),
              child: const Icon(Icons.add),
            ),
          ]),
        );
      },
    );
  }
}

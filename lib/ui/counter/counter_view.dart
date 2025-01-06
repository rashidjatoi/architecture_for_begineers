import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_bloc/ui/counter/counter_cubit/counter_cubit.dart';
import 'package:learn_bloc/ui/counter/counter_cubit/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('State is rebuilding');
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Column(
        children: [
          Text('This is a text'),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${state.numb}', style: TextStyle(fontSize: 60)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          context.read<CounterCubit>().updateCounterValue();
                        },
                        child: Text('Increment'),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          // Trigger the removeCounterValue method
                          context.read<CounterCubit>().removeCounterValue();
                        },
                        child: Text('Decrement'),
                      ),
                      SizedBox(width: 20),
                      TextButton(
                        onPressed: () {
                          // Trigger the resetCounterValue method
                          context.read<CounterCubit>().resetCounterValue();
                        },
                        child: Text('Reset'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

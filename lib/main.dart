import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                
                if (state is CounterInitial) {
                  return Text(
                    'Start',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                if (state is CounterResult) {
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return Text(
                  'Default',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Text('Decrement'),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Text('Increment'),
                ),
              ],
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

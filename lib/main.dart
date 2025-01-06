import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:learn_bloc/ui/user/user_cubit/user_list_cubit.dart';

import 'data/repository/user_implimentation.dart';
import 'domain/repositories/user_repository.dart';
import 'ui/counter/counter_cubit/counter_cubit.dart';
import 'ui/home_view.dart';
import 'ui/todo/cubit/todo_cubit.dart';

final getIt = GetIt.asNewInstance();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Service locator
  getIt.registerSingleton<UserRepository>(UserImplimentation());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (create) => UserListCubit(getIt())..fetchUsers(),
        ),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (create) => TodoCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}

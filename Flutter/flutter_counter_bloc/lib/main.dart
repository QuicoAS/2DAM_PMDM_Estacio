import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/counter/counter_bloc.dart';
import 'package:flutter_counter_bloc/presentation/blocs/tema/theme_bloc.dart';
import 'package:flutter_counter_bloc/presentation/screens/counter_home_page_screen.dart';
import 'package:flutter_counter_bloc/presentation/blocs/tema/theme_state.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Counter App',
            theme: themeState.themeData, 
            debugShowCheckedModeBanner: false,
            home: const CounterHomePageScreen(),
          );
        },
      ),
    );
  }
}
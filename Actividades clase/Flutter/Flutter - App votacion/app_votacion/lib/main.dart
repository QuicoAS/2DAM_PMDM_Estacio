import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'presentation/screens/selection_screen.dart';
import 'presentation/screens/yes_no_screen.dart';

void main() {
  runApp(VoteApp());
}

class VoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => SelectionScreen(),
        ),
        GoRoute(
          path: '/result',
          builder: (context, state) {
            final bool? vote = state.extra as bool?;
            return YesNoScreen(vote: vote);
          },
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        fontFamily: 'Shadows Into Light',
      ),
    );
  }
}

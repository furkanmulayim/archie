import 'package:archie/ui/detail/detail_view.dart';
import 'package:archie/ui/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String detailsPath = '/detail/:userId'; // Doğru parametre
  static String homePath = '/';

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    routes: <GoRoute>[
      GoRoute(
        path: homePath,
        builder: (BuildContext context, GoRouterState state) => HomeView(),
      ),
      GoRoute(
        path: detailsPath,
        builder: (BuildContext context, GoRouterState state) {
          final userId = int.parse(state.pathParameters['userId']!);
          return DetailView(userId: userId);
        },
      ),
    ],
  );
}

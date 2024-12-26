import 'package:archie/ui/detail/view/detail_view.dart';
import 'package:archie/ui/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  //params
  static String detailsPath = '/detail/:userId/:name';

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
          final name = state.pathParameters['name']!;
          return DetailView(userId: userId, name: name,);
        },
      ),
    ],
  );
}

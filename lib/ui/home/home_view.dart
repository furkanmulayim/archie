import 'package:archie/core/constants/texts.dart';
import 'package:archie/core/widgets/custom_flat_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomFlatAppBar(title: Texts.menuName),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  context.go('/details');
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}

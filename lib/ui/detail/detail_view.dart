import 'package:archie/core/constants/texts.dart';
import 'package:archie/core/widgets/custom_back_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomBackAppBar(
        title: Texts.menuName,
        click: () {
          context.go('/');
        },
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

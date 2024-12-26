import 'package:archie/core/constants/colores.dart';
import 'package:flutter/material.dart';

class CustomFlatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomFlatAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor:
          Colores.appBar100,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

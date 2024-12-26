part of '../view/detail_view.dart';

class _CustomBackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomBackAppBar({required this.title});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colores.grey100,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.go('/');
        },
      ),
    );
  }
}

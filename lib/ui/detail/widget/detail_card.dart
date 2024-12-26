part of '../view/detail_view.dart';

class _LazyList extends StatelessWidget {
  const _LazyList({required this.items});

  final List<DetailModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _DetailCard(detail: item);
      },
    );
  }
}

class _DetailCard extends StatelessWidget {
  const _DetailCard({required this.detail});

  final DetailModel detail;

  Widget _buildTitle(DetailModel detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${Texts.userId} ${detail.userId}",
          style: const TextStyle(
            fontSize: Dimens.mediumFontSize,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          detail.title,
          style: const TextStyle(
            fontSize: Dimens.largeFontSize,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildCompletedStatus(DetailModel detail) {
    return Row(
      children: [
        Icon(
          detail.completed ? Icons.check_circle : Icons.cancel,
          color: detail.completed ? Colores.green : Colores.red,
        ),
        const SizedBox(width: Dimens.h3size),
        Text(
          detail.completed ? Texts.completed : Texts.nocompleted,
          style: TextStyle(
            fontSize: Dimens.mediumFontSize,
            fontWeight: FontWeight.bold,
            color: detail.completed ? Colores.green : Colores.red,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
          vertical: Dimens.h3size, horizontal: Dimens.h1size),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.h2size),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.h1size),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sol taraftaki ID yuvarlak widget'ı
            CircleAvatar(
              backgroundColor: Colores.grey300,
              child: Text(
                detail.id.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: Dimens.h3size),
            // Sağ tarafta veriler
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle(detail),
                  const SizedBox(height: Dimens.h3size),
                  _buildCompletedStatus(detail),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

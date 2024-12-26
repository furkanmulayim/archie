part of '../view/home_view.dart';

class _LazyList extends StatelessWidget {
  const _LazyList({required this.items});

  final List<UserModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _UserCard(user: item);
      },
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({required this.user});

  final UserModel user;

  Widget _buildTitle(UserModel user) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          user.name,
          style: const TextStyle(
            fontSize: Dimens.extraLargeFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '➤${user.id}',
          style: const TextStyle(
            fontSize: Dimens.largeFontSize,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildAddress(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Texts.address,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('${user.address.street}, ${user.address.suite}'),
        Text('${user.address.city}, ${user.address.zipcode}'),
      ],
    );
  }

  Widget _buildCompany(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Texts.company,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(user.company.name),
        Text(user.company.catchPhrase),
        Text(user.company.bs),
      ],
    );
  }

  Widget _buildContact(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          Texts.contact,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text('${Texts.email} ${user.email}'),
        Text('${Texts.phone} ${user.phone}'),
        Text('${Texts.website} ${user.website}'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/detail/${user.id}/${user.name}');
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
            vertical: Dimens.h3size, horizontal: Dimens.h1size),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.h2size),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Dimens.h1size),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(user),
              const SizedBox(height: Dimens.h3size),
              _buildAddress(user),
              const SizedBox(height: Dimens.h3size),
              _buildCompany(user),
              const SizedBox(height: Dimens.h3size),
              _buildContact(user),
            ],
          ),
        ),
      ),
    );
  }
}

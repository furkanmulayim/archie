import 'package:archie/common/data/models/detail_model.dart';
import 'package:archie/common/data/repository/detail_repository.dart';
import 'package:archie/common/data/services/detail_api_service.dart';
import 'package:archie/core/constants/colores.dart';
import 'package:archie/core/constants/texts.dart';
import 'package:archie/ui/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
part '../detail/widget/app_bar.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.userId});

  final int userId;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late final DetailBloc detailBloc;

  @override
  void dispose() {
    detailBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Widget'ın userId'sine doğrudan widget.userId ile erişebilirsiniz.
    detailBloc = DetailBloc(
      detailRepo: DetailRepository(apiService: DetailApiService()),
    );
    detailBloc.add(DetailInitialEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: Scaffold(
        appBar: _CustomBackAppBar(),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            switch (state) {
              case DetailLoadingState():
                return Center(child: CircularProgressIndicator());
              case DetailLoadingSuccessState():
                return _LazyList(items: state.details);
              case DetailErrorState():
                return Center(child: Text('An error occurred.'));
              default:
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class _LazyList extends StatelessWidget {
  const _LazyList({required this.items});

  final List<DetailModel> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colores.grey300,
            child: Text(item.id.toString()),
          ),
          title: Text(item.completed.toString()),
          onTap: () {},
        );
      },
    );
  }
}

import 'package:archie/common/data/models/detail_model.dart';
import 'package:archie/common/data/repository/detail_repository.dart';
import 'package:archie/common/data/services/detail_api_service.dart';
import 'package:archie/core/constants/colores.dart';
import 'package:archie/core/constants/dimens.dart';
import 'package:archie/core/constants/texts.dart';
import 'package:archie/ui/detail/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
part '../widget/app_bar.dart';
part '../widget/detail_card.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.userId, required this.name});

  final String name;
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
    detailBloc = DetailBloc(
      detailRepo: DetailRepository(apiService: DetailApiService()),
    );
    //initialde parametre göndererek id ile arama request atacağız
    detailBloc.add(DetailInitialEvent(userId: widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailBloc,
      child: Scaffold(
        appBar: _CustomBackAppBar(title: widget.name),
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            switch (state) {
              case DetailLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case DetailLoadingSuccessState(): //success
                return _LazyList(items: state.details);
              case DetailErrorState(): //error
                return Center(child: Text('An error occurred.'));
              default: //default
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

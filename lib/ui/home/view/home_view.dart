import 'package:archie/common/data/models/user_model.dart';
import 'package:archie/common/data/repository/user_repository.dart';
import 'package:archie/common/data/services/user_api_service.dart';
import 'package:archie/core/constants/colores.dart';
import 'package:archie/core/constants/dimens.dart';
import 'package:archie/core/constants/texts.dart';
import 'package:archie/ui/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
part '../widget/app_bar.dart';
part '../widget/user_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeBloc homeBloc;

  @override
  void dispose() {
    // homeBloc  işlevini tamamladıktan sonra belleği temizlemek için kapatılır.
    homeBloc.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //bağımlılık azaltmak içinDependency Injection Kullanılabilir İleride
    homeBloc = HomeBloc(userRepo: UserRepository(apiService: UserApiService()));
    //Home initial eventi initial state'te ekledik, bu event verileri almak için başlatır
    homeBloc.add(HomeInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeBloc,
      child: Scaffold(
        appBar: _CustomFlatAppBar(),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case HomeLoadingState(): //loading
                return Center(child: CircularProgressIndicator());
              case HomeLoadingSuccessState(): //succes
                return _LazyList(items: state.users);
              case HomeErrorState(): //error
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
import 'package:archie/common/data/models/user_model.dart';
import 'package:archie/common/data/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.userRepo}) : super(HomeInitial()) {
    // HomeInitialEvent tetiklendiğinde yapılacak işlemler
    on<HomeInitialEvent>((event, emit) async {
      try {
        // repodan veri çeker
        final users = await userRepo.getUsers();
        // başarılı
        emit(HomeLoadingSuccessState(users: users));
      } catch (e) {
        // hata durumu
        emit(HomeErrorState());
      }
    });
  }
  final UserRepository userRepo;
}

import 'package:archie/common/data/models/detail_model.dart';
import 'package:archie/common/data/repository/detail_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required this.detailRepo}) : super(DetailInitial()) {
    // Detail initial tetiklendiğinde yapılacak işlemler
    on<DetailInitialEvent>((event, emit) async {
      try {
        // repodan verileri çeker - event'in user idsini parametre verdik
        final details = await detailRepo.getDetail(event.userId);
        // başarılı durumu
        emit(DetailLoadingSuccessState(details: details));
      } catch (e) {
        // hata durumu
        emit(DetailErrorState());
      }
    });
  }
  final DetailRepository detailRepo;
}

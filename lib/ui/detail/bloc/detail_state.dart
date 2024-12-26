part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

//İnitial state
class DetailInitial extends DetailState {}

//veri gelmeden önceki state
class DetailLoadingState extends DetailState {}

//veri geldiğindeki state
class DetailLoadingSuccessState extends DetailState {
  DetailLoadingSuccessState({
    required this.details,
  });
  final List<DetailModel> details;
}

//veri çekilirken hata durumu state
class DetailErrorState extends DetailState {}

part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

//İnitial state
class HomeInitial extends HomeState {}

//veri gelmeden önceki state
class HomeLoadingState extends HomeState {}

//veri geldiğindeki state
class HomeLoadingSuccessState extends HomeState {
  HomeLoadingSuccessState({
    required this.users,
  });
  final List<UserModel> users;
}

//veri çekilirken hata durumu state
class HomeErrorState extends HomeState {}

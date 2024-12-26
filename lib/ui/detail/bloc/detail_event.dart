part of 'detail_bloc.dart';

@immutable
abstract class DetailEvent {}

//İnitial event'i
class DetailInitialEvent extends DetailEvent {
  //userId ile event başlatmak için
  DetailInitialEvent({required this.userId});
  final int userId;
}

part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class OnSetLista extends HomeBlocEvent {
  final Future<List<Pueblo>> pueblos;

  OnSetLista({required this.pueblos});
}

class OnSelect extends HomeBlocEvent {
  final Pueblo pueblo;

  OnSelect({required this.pueblo});
}

class OnDetalles extends HomeBlocEvent {
  final Pueblo pueblo;

  OnDetalles({required this.pueblo});
}

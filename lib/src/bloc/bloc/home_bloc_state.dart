part of 'home_bloc_bloc.dart';

class HomeBlocState {
  final Future<List<Pueblo>>? pueblos;
  final Pueblo? select;
  HomeBlocState({this.pueblos, this.select});
  HomeBlocState copyWith({Future<List<Pueblo>>? puebloss, Pueblo? selects}) =>
      HomeBlocState(pueblos: puebloss ?? pueblos, select: selects ?? select);
}

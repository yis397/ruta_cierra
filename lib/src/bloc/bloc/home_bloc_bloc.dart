import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_ruta/src/models/pueblo_model.dart';
import 'package:flutter_ruta/src/services/notification_service.dart';
import 'package:flutter_ruta/src/services/pueblo-service.dart';
import 'package:meta/meta.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final PuebloService puebloService = PuebloService();
  NotificationService notificationService = NotificationService();
  List<Pueblo> pueblos = [];
  HomeBlocBloc() : super(HomeBlocState()) {
    tz.initializeTimeZones();
    init();
    on<HomeBlocEvent>((event, emit) {
      if (event is OnSetLista) {
        emit(state.copyWith(puebloss: event.pueblos));
        event.pueblos.then((value) => add(OnSelect(pueblo: value[0])));
      } else if (event is OnSelect) {
        emit(state.copyWith(selects: event.pueblo));
      } else if (event is OnDetalles) {
        emit(state.copyWith(selects: event.pueblo));
      }
    });
  }
  void init() async {
    Timer(
        const Duration(seconds: 1),
        () => {
              add(OnSetLista(pueblos: puebloService.getPueblos())),
            });
  }

  void detallesPueblo() async {
    final exist = pueblos.indexWhere((item) => item.id == state.select!.id);
    if (exist != -1) {
      add(OnDetalles(pueblo: pueblos[exist]));
      return;
    }
    final puebl = await puebloService.getPueblo(state.select!);
    Timer(
        const Duration(microseconds: 200),
        () => {
              pueblos.add(puebl),
              add(OnDetalles(pueblo: puebl)),
              notificationService.showNotification(puebl.id, puebl.nombre,
                  'Inicio de festividades', puebl.infiesta)
            });
  }
}

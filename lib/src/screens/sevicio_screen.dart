import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ruta/src/themes/theme.dart';
import 'package:flutter_ruta/src/widget/index.dart';
import '../bloc/bloc/home_bloc_bloc.dart';

class ServicioScreen extends StatelessWidget {
  const ServicioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final list =
        BlocProvider.of<HomeBlocBloc>(context).state.select!.actividades;
    return Scaffold(
        appBar: AppBar(
          actions: [
            ButtonIcon(
              funcion: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              size: 35,
            ),
          ],
          title: Center(child: texto('Turismo', 17, 3, colores['text']!)),
          backgroundColor: Color(colores['fond2']!),
        ),
        body: list.isEmpty
            ? const Center(
                child: Text('Sin Actividades'),
              )
            : Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                width: size.width,
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardActividad(size: size, actividad: list[index]);
                  },
                )));
  }
}

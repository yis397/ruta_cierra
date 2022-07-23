import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ruta/src/models/pueblo_model.dart';
import 'package:flutter_ruta/src/widget/index.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/bloc/home_bloc_bloc.dart';
import '../themes/theme.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: size.height,
          color: Color(colores['fond2']!),
          child: SingleChildScrollView(
            child: BlocBuilder<HomeBlocBloc, HomeBlocState>(
              builder: (context, state) {
                if (state.select!.clima == "") {
                  return const Center(
                    child: Text('sin datos'),
                  );
                }
                return Column(
                  children: [
                    SizedBox(
                      height: size.height < 1950
                          ? size.height * 0.80
                          : size.height * 0.7,
                      width: size.width,
                      child: HeadDetalle(size: size),
                    ),
                    FootDetalle(pueblo: state.select ?? Pueblo())
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButton: ButtonIcon(
          funcion: () async {
            final Uri uri = Uri.parse(
                'https://www.google.com/maps/search/?api=1&query=18.3332862%2C-97.016833');
            if (!await launchUrl(uri)) {
              throw 'Could not launch $uri';
            }
          },
          icon: const Icon(
            Icons.near_me_sharp,
            color: Colors.white,
          ),
          size: 50,
        ));
  }
}

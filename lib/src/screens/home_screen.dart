import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ruta/src/bloc/bloc/home_bloc_bloc.dart';
import 'package:flutter_ruta/src/models/pueblo_model.dart';
import 'package:flutter_ruta/src/themes/theme.dart';
import 'package:flutter_ruta/src/widget/index.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pueblo = Pueblo();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(colores['fond']!),
      ),
      body: BlocBuilder<HomeBlocBloc, HomeBlocState>(
        builder: (context, state) {
          return Container(
            color: Color(colores['fond']!),
            width: size.width,
            height: size.height,
            child: Column(
              children: [
                Container(
                  color: Color(colores['fond']!),
                  height: size.height * .5,
                  width: size.width,
                  child: HeadHome(
                    size: size,
                    pueblo: state.select ?? pueblo,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      texto(' Conoce mas', 10, 2, colores['text']!),
                      const SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List<Pueblo>>(
                        future: state.pueblos,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Pueblo>> snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              width: size.width,
                              height: size.height < 1950
                                  ? size.height * .30
                                  : size.height * .32,
                              child: FooterHomet(
                                size: size,
                                list: snapshot.data!,
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Sin Conexion');
                          } else {
                            return const SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

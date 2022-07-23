part of 'index.dart';

class HeadDetalle extends StatelessWidget {
  final Size size;
  const HeadDetalle({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pueblo = BlocProvider.of<HomeBlocBloc>(context).state.select;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 0),
          color: Colors.amber,
          width: size.width,
          height: size.height * 0.33,
          child: ClipRRect(
              child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: const AssetImage('assets/zoq.jpg'),
            height: size.height * 0.7,
            fit: BoxFit.cover,
          )),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: EdgeInsets.only(
                top: size.height < 1950
                    ? size.height * 0.05
                    : size.height * 0.2),
            width: size.width * 0.9,
            height: size.height < 1950 ? size.height * 0.7 : size.height * 0.6,
            decoration: BoxDecoration(
                color: const Color.fromARGB(174, 22, 44, 33),
                borderRadius: BorderRadius.circular(15)),
            child: DetallesBody(
              size: size,
              pueblo: pueblo ?? Pueblo(),
            ),
          ),
        )
      ],
    );
  }
}

class DetallesBody extends StatelessWidget {
  final Pueblo pueblo;
  final Size size;
  const DetallesBody({Key? key, required this.size, required this.pueblo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20,
            ),
          ),
          const Spacer(),
          Boton(
              text: 'Ocio',
              alto: 30,
              color: colores['btn2']!,
              funcion: () => Navigator.pushNamed(context, 'ocio')),
        ],
      ),

      //DATOS
      Container(
          margin: const EdgeInsets.only(bottom: 10, top: 0),
          child: Row(
            children: [
              const Icon(
                Icons.wb_sunny_rounded,
                size: 50,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tiulo(
                      texto: pueblo.nombre,
                      size: 15,
                      sep: 2,
                      color: colores['text']!,
                      color2: colores['text']!),
                  texto(pueblo.completo, 11, 3, colores['text']!)
                ],
              ),
            ],
          )),
      const SizedBox(
        height: 10,
      ),
      //IMAGENES
      SizedBox(
        width: size.width,
        height: 100,
        child: Wrap(direction: Axis.vertical, spacing: 15, children: [
          SizedBox(
            width: size.width * 0.8,
            child: CarruselImg(
              list: pueblo.fotos,
            ),
          ),
          texto('Imagenes tomadas desde un cel', 10, 3, colores['text']!),
        ]),
      ),
      const Divider(
        height: 30,
        color: Colors.white,
      ),
      const SizedBox(
        height: 5,
      ),
      //datos
      SizedBox(
          width: size.width,
          height: size.height < 1950 ? 120 : 100,
          child: Column(children: [
            SizedBox(
                width: size.width,
                child: Row(
                  children: [
                    SizedBox(
                        width: size.height < 1950
                            ? size.width * 0.45
                            : size.width * 0.5,
                        height: size.height < 1950
                            ? size.height * 0.20
                            : size.height * .12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            texto('Poblacion: 1850', 11, 4, colores['text']!),
                            texto('Clima: ${pueblo.clima}', 11, 4,
                                colores['text']!),
                            const SizedBox(
                              height: 10,
                            ),
                            texto('Servicios', 11, 3, colores['text']!),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(Icons.wifi),
                                Icon(Icons.wifi),
                                Icon(Icons.wifi),
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      width: size.height < 1950
                          ? size.width * 0.35
                          : size.width * 0.30,
                      height: size.height * .12,
                      child: Row(
                        children: [
                          const Center(
                            child: Icon(
                              Icons.festival_sharp,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              texto('Fiesta', 10, 2, colores['text']!),
                              texto(pueblo.infiesta, 8, 2, colores['text']!),
                              texto('a', 10, 2, colores['text']!),
                              texto(pueblo.finfiesta, 8, 2, colores['text']!),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ]))
    ]);
  }
}

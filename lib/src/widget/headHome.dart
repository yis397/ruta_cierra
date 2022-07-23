part of 'index.dart';

class HeadHome extends StatelessWidget {
  final Size size;
  final Pueblo pueblo;
  const HeadHome({Key? key, required this.size, required this.pueblo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = BlocProvider.of<HomeBlocBloc>(context);
    //final service = PuebloService();
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(left: size.width * 0.28),
        width: size.width * .7,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: AssetImage(pueblo.img != ""
                  ? 'assets/${pueblo.img}'
                  : 'assets/no-image.jpg'),
              height: size.height * 0.7,
              fit: BoxFit.cover,
            )),
      ),
      Container(
          margin: const EdgeInsets.only(left: 10, top: 20),
          padding: const EdgeInsets.all(8),
          width: size.width * 0.45,
          height: size.height < 1950 ? size.height * 0.50 : size.height * 0.40,
          decoration: BoxDecoration(
              color: const Color.fromARGB(100, 22, 44, 33),
              borderRadius: BorderRadius.circular(20)),
          child: pueblo.img != ""
              ? Column(children: [
                  Tiulo(
                      texto: pueblo.nombre,
                      size: 15,
                      sep: 0,
                      color: colores['text']!,
                      color2: colores['text']!),
                  titulo(pueblo.completo, 10, 2, colores['text']!),
                  const Divider(
                    height: 10,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * .2,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: texto(pueblo.descripcion, 10, 2, colores['text']!),
                    ),
                  ),
                  Boton(
                    text: ' Mas',
                    alto: 40,
                    color: colores['btn2']!,
                    funcion: () => {
                      // service.prueba()
                      Navigator.pushNamed(context, "detail"),
                      home.detallesPueblo()
                    },
                  )
                ])
              : Column(
                  children: [
                    const Divider(
                      height: 20,
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: const LinearProgressIndicator(
                        color: Colors.grey,
                        minHeight: 15,
                      ),
                    ),
                    const Divider(
                      height: 25,
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: const LinearProgressIndicator(
                        color: Colors.grey,
                        minHeight: 10,
                      ),
                    ),
                    const Divider(
                      height: 30,
                    ),
                    SizedBox(
                      width: size.width * .4,
                      child: const LinearProgressIndicator(
                        color: Colors.grey,
                        minHeight: 30,
                      ),
                    )
                  ],
                ))
    ]);
  }
}

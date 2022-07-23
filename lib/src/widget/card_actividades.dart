part of 'index.dart';

class CardActividad extends StatelessWidget {
  final Size size;
  final Actividad actividad;
  const CardActividad({Key? key, required this.size, required this.actividad})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: size.width * 0.95,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: Color(colores['fond2']!),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: size.width * 0.3,
            height: size.height * 0.2,
            decoration: const BoxDecoration(),
            child: FullScreenWidget(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: AssetImage('assets/${actividad.img}'),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: size.width * .6,
              height: size.height * .2,
              child: MaterialButton(
                onPressed: () {
                  _showMyDialog(context);
                },
                child: Column(
                  children: [
                    texto(actividad.nombre, 15, 2, colores['text']!),
                    SizedBox(
                      height: size.height * .1,
                      child:
                          texto(actividad.actividad, 12, 2, colores['text']!),
                    ),
                    SizedBox(
                      height: size.height < 1950
                          ? size.height * .05
                          : size.height * .06,
                      child: Center(
                          child: ButtonIcon(
                        funcion: () => print('hola'),
                        icon: const Icon(
                          Icons.near_me_sharp,
                          color: Colors.white,
                        ),
                        size: 30,
                      )),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(actividad.nombre),
          content: Text(actividad.actividad),
          actions: <Widget>[
            TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ],
        );
      },
    );
  }
}

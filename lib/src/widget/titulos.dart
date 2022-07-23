part of 'index.dart';

class Tiulo extends StatelessWidget {
  final String texto;
  final double size;
  final double sep;
  final int color;
  final int color2;
  const Tiulo({
    Key? key,
    required this.texto,
    required this.size,
    required this.sep,
    required this.color,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        titulo(texto[0].toUpperCase(), size * 2, sep, color),
        titulo(texto.split(texto[0])[1], size, sep, color2),
      ],
    );
  }
}

class Boton extends StatelessWidget {
  final String text;
  final double alto;
  final int color;
  final Function funcion;
  const Boton({
    Key? key,
    required this.text,
    required this.alto,
    required this.color,
    required this.funcion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => funcion(),
      child: Container(
        width: 100,
        height: alto,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(color)),
        child: Center(child: texto(text, 12, 2, colores['text']!)),
      ),
    );
  }
}

Widget titulo(
  String texto,
  double size,
  double sep,
  int color,
) {
  return Text(
    texto,
    style: TextStyle(
        fontFamily: "Opensans",
        fontSize: size,
        fontWeight: texto.length > 1 ? FontWeight.bold : FontWeight.normal,
        color: Color(color),
        letterSpacing: sep),
  );
}

Widget texto(
  String texto,
  double size,
  double sep,
  int color,
) {
  return Text(
    texto,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.normal,
        color: Color(color),
        letterSpacing: sep),
  );
}

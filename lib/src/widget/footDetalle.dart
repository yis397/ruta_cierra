part of 'index.dart';

class FootDetalle extends StatelessWidget {
  final Pueblo pueblo;
  const FootDetalle({Key? key, required this.pueblo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Tiulo(
              texto: 'Ubicacion',
              size: 15,
              sep: 3,
              color: colores['text']!,
              color2: colores['text']!),
          const Divider(
            height: 20,
          ),
          texto(pueblo.ubicacionText, 13, 2, colores['text']!),
          const Divider(
            height: 10,
          ),
          Tiulo(
              texto: 'Historia',
              size: 15,
              sep: 3,
              color: colores['text']!,
              color2: colores['text']!),
          const Divider(
            height: 20,
          ),
          //texto
          texto(pueblo.historia, 13, 2, colores['text']!)
        ],
      ),
    );
  }
}

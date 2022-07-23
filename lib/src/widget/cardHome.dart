part of 'index.dart';

//CardHome(size: size);
class CardHome extends StatelessWidget {
  const CardHome({
    Key? key,
    required this.size,
    required this.pueblo,
  }) : super(key: key);

  final Size size;
  final Pueblo pueblo;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: size.width * 0.4,
        height: size.height * 0.17,
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: const AssetImage('assets/zoq.jpg'),
              height: size.height * 0.15,
              fit: BoxFit.cover,
            )),
      ),
      Container(
        width: size.width * 0.4,
        height: size.height * 0.10,
        decoration: BoxDecoration(
            color: Color(colores['btn']!),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Center(
            child: Tiulo(
                texto: pueblo.nombre,
                size: size.height < 1950 ? 12 : 15,
                sep: 3,
                color: colores['text']!,
                color2: colores['text']!),
          ),
        ),
      ),
    ]);
  }
}

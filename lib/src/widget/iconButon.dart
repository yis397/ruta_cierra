part of 'index.dart';

class ButtonIcon extends StatelessWidget {
  final double size;
  final Icon icon;
  final Function funcion;
  const ButtonIcon({
    Key? key,
    required this.funcion,
    required this.size,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => funcion(),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color(colores['btn2']!)),
        child: Center(child: icon),
      ),
    );
  }
}

// ignore_for_file: file_names

part of 'index.dart';

class FooterHomet extends StatelessWidget {
  final Size size;
  final List<Pueblo> list;
  const FooterHomet({Key? key, required this.size, required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = BlocProvider.of<HomeBlocBloc>(context);
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: (i, ch) => {home.add(OnSelect(pueblo: list[i]))},
          viewportFraction: .6,
          height: 300,
          enlargeCenterPage: true),
      items: list.map((i) {
        return Builder(builder: (BuildContext context) {
          return (CardHome(
            pueblo: i,
            size: size,
          ));
        });
      }).toList(),
    );
  }
}

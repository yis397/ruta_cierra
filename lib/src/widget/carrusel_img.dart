part of 'index.dart';

class CarruselImg extends StatelessWidget {
  final List<Foto> list;
  const CarruselImg({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          onPageChanged: (i, ch) => {},
          viewportFraction: .25,
          height: 70,
          enableInfiniteScroll: false),
      items: list.map((i) {
        return Builder(builder: (BuildContext context) {
          return (FullScreenWidget(
            child: SizedBox(
              width: 70,
              height: 70,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: AssetImage('assets/${i.img}'),
                    fit: BoxFit.cover,
                  )),
            ),
          ));
        });
      }).toList(),
    );
  }
}

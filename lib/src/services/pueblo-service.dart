import 'package:flutter_ruta/src/models/pueblo_model.dart';
import 'package:http/http.dart' as http;

const _url = 'http://192.168.0.103/api';
const _key = 'fnPqT5xQEi5Vcb9wKwbCf65c3BjVGyBB';

class PuebloService {
  Future<List<Pueblo>> getPueblos() async {
    final url = Uri.parse('$_url/pueblos?api_key=$_key');
    final data = await http.get(url);
    //final pueblos = pueblosFromJson2(data.body);
    return pueblosFromJson(data.body).data;
  }

  Future<Pueblo> getPueblo(Pueblo pueblo) async {
    final data =
        await http.get(Uri.parse('$_url/pueblos/${pueblo.id}?api_key=$_key'));
    pueblo.fromJson2(data.body);
    //final pueblos = pueblosFromJson2(data.body);
    return pueblo;
  }

  /*  void prueba() async {
    final data = await http.get(Uri.parse('$_url/pueblos/1?api_key=$_key'));
    final puebl = json.decode(data.body);
    print(puebl['pueblo']);
    //final pueblos = pueblosFromJson2(data.body);
  } */
}

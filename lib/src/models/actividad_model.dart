class Actividad {
  int puebloid = 0;
  int id = 0;
  String nombre = '';
  String latitud = '';
  String longitud = '';
  String img = '';
  String actividad = '';
  Actividad(Map str) {
    setValores(str);
  }
  setValores(Map str) {
    id = str["id"];
    nombre = str["nombre"];
    img = str["img"];
    puebloid = str["pueblo_id"];
    latitud = str["latitud"];
    longitud = str["longitud"];
    actividad = str["actividad"];
  }
}

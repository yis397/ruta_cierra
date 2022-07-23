class Foto {
  int id = 0;
  String nombre = "";
  String img = "";
  int puebloid = 0;
  Foto(Map str) {
    setValores(str);
  }
  setValores(Map str) {
    id = str["id"];
    nombre = str["nombre"];
    img = str["img"];
    puebloid = str["pueblo_id"];
  }
}

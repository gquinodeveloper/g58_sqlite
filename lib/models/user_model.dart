class UserModel {
  UserModel({
    this.id,
    this.nombre,
    this.apellido,
    this.avatar,
  });

  int? id;
  String? nombre;
  String? apellido;
  String? avatar;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "avatar": avatar,
      };
}

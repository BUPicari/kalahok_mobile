import 'dart:convert';

User userFromJson(String str) {
  final jsonData = json.decode(str);
  return User.fromMap(jsonData);
}

String userToJson(User data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class User {
  int id;
  String userName;
  String email;
  String password;
  int status;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.status,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_name": userName,
        "email": email,
        "password": password,
        "status": status,
      };
}

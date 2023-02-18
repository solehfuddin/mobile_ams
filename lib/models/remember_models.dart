part of 'models.dart';

class RememberModel {
  String? username, password;

  RememberModel(this.username, this.password);

  RememberModel.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}

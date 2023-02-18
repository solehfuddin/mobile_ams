part of 'models.dart';

class LoginResModel {
  late final bool status;
  late final String message;
  UserModel? user;

  LoginResModel(this.status, this.message, this.user);

  LoginResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        user = json['data'] != null
            ? UserModel.fromJson(json['data'])
            : json['data'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'user': user,
      };
}

part of 'models.dart';

class GlobalModels {
  bool? status;
  String? message;

  GlobalModels(this.status, this.message);

  GlobalModels.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };
}

part of 'models.dart';

class NotificationModel {
  String? userId, title, body, custName, address, createdAt;

  NotificationModel(
      {this.userId,
      this.title,
      this.body,
      this.custName,
      this.address,
      this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        title = json['title'],
        body = json['body'],
        custName = json['cust_name'],
        address = json['address'],
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'title': title,
        'body': body,
        'cust_name': custName,
        'address': address,
        'created_at': createdAt
      };
}

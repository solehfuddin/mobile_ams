part of 'models.dart';

class FeedbackResModel {
  bool? status;
  bool? message;
  FeedbackModel? feedback;

  FeedbackResModel({this.status, this.message, this.feedback});

  FeedbackResModel.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        message = json['message'],
        feedback = json['data'] != null
            ? FeedbackModel.fromJson(json['data'])
            : json['data'];

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': feedback,
      };
}

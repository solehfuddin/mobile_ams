part of 'models.dart';

class TroubleResModel {
  bool? status;
  bool? message;
  List<TroubleModel>? trouble;

  TroubleResModel({this.status, this.message, this.trouble});

  // TroubleResModel.fromJson(Map<String, dynamic> json)
  //     : status = json['status'],
  //       message = json['message'],
  //       trouble = json['data'] != null
  //           ? TroubleModel.fromJson(json['data'])
  //           : json['data'];

  TroubleResModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        // print(v);
        trouble?.add(TroubleModel.fromJson(v));

        // trouble?.forEach((element) {
        //   print(element);
        // });
      });
    }
  }

  // Map<String, dynamic> toJson() => {
  //       'status': status,
  //       'message': message,
  //       'data': trouble,
  //     };

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['status'] = status;
    data['message'] = message;
    data['data'] = trouble?.map((v) => v.toJson()).toList();

    return data;
  }
  // Map<String, dynamic> toJson() {
  //   // final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = status;
  //   data['message'] = message;
  //   if (data != null) {
  //     data['data'] = data.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

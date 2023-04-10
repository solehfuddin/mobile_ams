part of 'models.dart';

class UserModel {
  late final String? userId,
      technicianId,
      username,
      password,
      fullname,
      nik,
      phone,
      email,
      lat,
      long,
      userimg,
      idlests,
      level,
      isActive,
      fcmToken,
      createdAt;

  UserModel(
    this.userId,
    this.technicianId,
    this.username,
    this.password,
    this.fullname,
    this.nik,
    this.phone,
    this.email,
    this.lat,
    this.long,
    this.userimg,
    this.idlests,
    this.level,
    this.isActive,
    this.fcmToken,
    this.createdAt,
  );

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'],
        technicianId = json['technician_id'],
        username = json['username'],
        fullname = json['fullname'],
        nik = json['nik'],
        phone = json['phone_number'] ?? "Not set",
        email = json['email'] ?? "Not set",
        lat = json['lat'] ?? "",
        long = json['long'] ?? "",
        userimg = json['user_image'] ?? "",
        idlests = json['idle_status'],
        level = json['level'],
        isActive = json['is_active'],
        fcmToken = json['fcm_token'] ?? "",
        createdAt = json['created_at'];

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'technician_id': technicianId,
        'username': username,
        'fullname': fullname,
        'nik': nik,
        'phone_number': phone,
        'email': email,
        'lat': lat,
        'long': long,
        'user_image': userimg,
        'idle_status': idlests,
        'level': level,
        'is_active': isActive,
        'fcm_token': fcmToken,
        'created_at': createdAt,
      };
}

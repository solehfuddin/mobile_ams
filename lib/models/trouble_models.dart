part of 'models.dart';

class TroubleModel {
  late final String? troubleId,
      troubleNo,
      title,
      description,
      troubleCategoryCode,
      technisianId,
      customerCode,
      picName,
      latt,
      long,
      address,
      areaCode,
      phoneNumber,
      rowState,
      isSolved,
      reason,
      userInput,
      reqTime,
      createdAt,
      custName,
      rowStateName,
      categoryName;

  TroubleModel(
      this.troubleId,
      this.troubleNo,
      this.title,
      this.description,
      this.troubleCategoryCode,
      this.technisianId,
      this.customerCode,
      this.picName,
      this.latt,
      this.long,
      this.address,
      this.areaCode,
      this.phoneNumber,
      this.rowState,
      this.isSolved,
      this.reason,
      this.userInput,
      this.reqTime,
      this.createdAt,
      this.custName,
      this.rowStateName,
      this.categoryName);

  TroubleModel.fromJson(Map<String, dynamic> json)
      : troubleId = json['trouble_id'],
        troubleNo = json['trouble_no'],
        title = json['title'],
        description = json['description'],
        troubleCategoryCode = json['trouble_categories_code'],
        technisianId = json['technician_id'],
        customerCode = json['customer_code'] ?? "Not set",
        picName = json['pic_name'] ?? "Not set",
        latt = json['lat'] ?? "",
        long = json['long'] ?? "",
        address = json['address'] ?? "",
        areaCode = json['area_code'],
        phoneNumber = json['phone_number'],
        rowState = json['rowstate'],
        isSolved = json['is_solved'],
        reason = json['reason'],
        userInput = json['user_input'],
        reqTime = json['requested_time'],
        createdAt = json['created_at'],
        custName = json['cust_name'],
        rowStateName = json['rowstate_name'],
        categoryName = json['categories_name'];

  Map<String, dynamic> toJson() => {
        'trouble_id': troubleId,
        'trouble_no': troubleNo,
        'title': title,
        'description': description,
        'trouble_categories_code': troubleCategoryCode,
        'technician_id': technisianId,
        'customer_code': customerCode,
        'pic_name': picName,
        'lat': latt,
        'long': long,
        'address': address,
        'area_code': areaCode,
        'phone_number': phoneNumber,
        'rowstate': rowState,
        'is_solved': isSolved,
        'reason': reason,
        'user_input': userInput,
        'requested_time': reqTime,
        'created_at': createdAt,
        'cust_name': custName,
        'rowstate_name': rowStateName,
        'categories_name': categoryName
      };
}

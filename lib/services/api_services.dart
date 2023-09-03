part of 'services.dart';

class ApiServices {
  Dio get _dio => myDio();

  Future<LoginResModel> apiLogin(var data) async {
    late LoginResModel responseApi;

    try {
      var response = await _dio.post("login",
          data: jsonEncode(data), cancelToken: CancelToken());

      responseApi = LoginResModel.fromJson(response.data);
    } on DioError catch (e) {
      String sts = "";
      if (e.response?.statusCode == 400) {
        sts = "Wrong username or password";
      } else if (e.response?.statusCode == 403) {
        sts = "Invalid API key";
      } else {
        sts = "General Error";
        print(e);
        // sts = e.response!.statusCode.toString();
      }

      responseApi = LoginResModel(false, sts, null);
    }

    return responseApi;
  }

  Future<GlobalModels> apiUpdateUser(var data) async {
    late GlobalModels responseApi;

    try {
      var response = await _dio.post(
        "users/update",
        data: jsonEncode(data),
        cancelToken: CancelToken(),
      );

      responseApi = GlobalModels.fromJson(response.data);
    } on DioError catch (e) {
      String sts = "";
      if (e.response?.statusCode == 401) {
        sts = "Please check data";
      } else if (e.response?.statusCode == 403) {
        sts = "Invalid API key";
      } else {
        sts = "General Error";
      }

      responseApi = GlobalModels(false, sts);
    }

    return responseApi;
  }

  Future<GlobalModels> apiUpdateTechnisian(var data) async {
    late GlobalModels responseApi;

    try {
      var response = await _dio.put(
        "technicians/update",
        data: jsonEncode(data),
        cancelToken: CancelToken(),
      );

      responseApi = GlobalModels.fromJson(response.data);
    } on DioError catch (e) {
      String sts = "";
      if (e.response?.statusCode == 401) {
        sts = "Please check data";
      } else if (e.response?.statusCode == 403) {
        sts = "Invalid API key";
      } else {
        sts = "General Error";
      }

      responseApi = GlobalModels(false, sts);
    }

    return responseApi;
  }

  Future<List<TroubleModel>> apiGetVisiting(var data) async {
    List<TroubleModel> responseApi = List.empty(growable: true);

    try {
      var response = await _dio.post(
        "troubles/getall_by",
        data: jsonEncode(data),
        cancelToken: CancelToken(),
      );

      responseApi = (response.data['data'] as List)
          .map(
            (e) => TroubleModel.fromJson(e),
          )
          .toList();
    } on DioError catch (e) {
      bool sts = false;
      if (e.response?.statusCode == 400) {
        sts = false;
      } else if (e.response?.statusCode == 403) {
        sts = false;
      } else {
        sts = false;
      }
    }

    return responseApi;
  }

  Future<List<NotificationModel>> apiGetNotification(var data) async {
    List<NotificationModel> responseApi = List.empty(growable: true);

    try {
      var response = await _dio.post(
        "notifications/getall_by",
        data: jsonEncode(data),
        cancelToken: CancelToken(),
      );

      // print(response);

      responseApi = (response.data['data'] as List)
          .map(
            (e) => NotificationModel.fromJson(e),
          )
          .toList();
    } on DioError catch (e) {
      bool sts = false;
      if (e.response?.statusCode == 400) {
        sts = false;
      } else if (e.response?.statusCode == 403) {
        sts = false;
      } else {
        sts = false;
      }
    }

    return responseApi;
  }

  Future<GlobalModels> apiUpdateTrouble(var data) async {
    late GlobalModels responseApi;

    try {
      var response = await _dio.put(
        "troubles/update_trouble",
        data: jsonEncode(data),
        cancelToken: CancelToken(),
      );

      responseApi = GlobalModels.fromJson(response.data);
    } on DioError catch (e) {
      String sts = "";
      if (e.response?.statusCode == 401) {
        sts = "Please check data";
      } else if (e.response?.statusCode == 403) {
        sts = "Invalid API key";
      } else {
        sts = "General Error";
      }

      responseApi = GlobalModels(false, sts);
    }

    return responseApi;
  }

  Future<GlobalModels> apiPostFeedback(var data) async {
    late GlobalModels responseApi;

    try {
      var response = await _dio.post(
        "trouble_feedbacks",
        // data: jsonEncode(data),
        data: data,
        cancelToken: CancelToken(),
      );

      responseApi = GlobalModels.fromJson(response.data);
    } on DioError catch (e) {
      String sts = "";
      if (e.response?.statusCode == 401) {
        sts = "Please check data";
      } else if (e.response?.statusCode == 403) {
        sts = "Invalid API key";
      } else {
        sts = "General Error";
      }

      // print("Errornya : ${e.message}");

      // String? sts = e.message;

      responseApi = GlobalModels(false, sts);
    }

    return responseApi;
  }

  Future<FeedbackResModel> apiGetFeedback(var data) async {
    late FeedbackResModel responseApi;

    try {
      var response = await _dio.get(
        "trouble_feedbacks/getby",
        queryParameters: {"trouble_no_index": data},
        cancelToken: CancelToken(),
      );

      // print(response);

      responseApi = FeedbackResModel.fromJson(response.data);
    } on DioError catch (e) {
      bool sts = false;
      if (e.response?.statusCode == 400) {
        sts = false;
      } else if (e.response?.statusCode == 403) {
        sts = false;
      } else {
        sts = false;
      }
    }

    return responseApi;
  }
}

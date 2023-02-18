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
}

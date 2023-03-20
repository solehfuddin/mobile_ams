part of 'controllers.dart';

class TroubleController extends GetxController {
  final session = SessionServices();
  late UserModel user;
  var technicianId = "".obs;
  var isLoading = false.obs;
  var isError = false.obs;
  var errorMsg = "".obs;
  var troubleData = <TroubleModel>[].obs;

  TroubleController() {
    user = session.readUserSession();
    technicianId.value = user.technicianId ?? '';
  }

  void getData(BuildContext context, var rowState) {
    isLoading.value = true;
    troubleData.clear();

    var technisianId = technicianId.value;

    var formData = rowState == ""
        ? {
            "technician_id": technisianId,
          }
        : {
            "technician_id": technisianId,
            "rowstate": rowState,
          };

    if (technisianId.isNotEmpty) {
      ApiServices().apiGetVisiting(formData).then((value) {
        isLoading.value = false;

        if (value.isNotEmpty) {
          troubleData.value = value;
        }
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog("Technisian id null"),
      );
    }
  }
}

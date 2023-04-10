part of 'controllers.dart';

class NotificationController extends GetxController {
  final session = SessionServices();
  late UserModel user;
  var userId = "".obs;
  var fcmToken = "".obs;
  var isLoading = false.obs;
  var notifData = <NotificationModel>[].obs;

  NotificationController() {
    user = session.readUserSession();
    fcmToken.value = user.fcmToken ?? '';
    userId.value = user.userId ?? '';
  }

  void getData(BuildContext context) {
    isLoading.value = true;
    notifData.clear();

    var userid = userId.value;

    var formData = {
      "user_id": userid,
    };

    if (userid.isNotEmpty) {
      ApiServices().apiGetNotification(formData).then((value) {
        isLoading.value = false;

        if (value.isNotEmpty) {
          notifData.value = value;
        }
      });
    } else {
      showDialog(
        context: context,
        builder: (context) => ErrorDialog("User id null"),
      );
    }
  }
}

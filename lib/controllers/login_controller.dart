part of 'controllers.dart';

class LoginController extends GetxController {
  final session = SessionServices();
  var loading = false.obs;
  var isUsername = true.obs;
  var isPassword = true.obs;
  var rememberUser = "".obs;
  var rememberPass = "".obs;

  void handleLoading() => loading.value = !loading.value;

  void checkUsername(String? username) {
    username != null
        ? username.isEmpty
            ? isUsername.value = false
            : isUsername.value = true
        : isUsername.value = false;
  }

  void checkPassword(String? password) {
    password != null
        ? password.isEmpty
            ? isPassword.value = false
            : isPassword.value = true
        : isPassword.value = false;
  }

  void login({BuildContext? context, String? username, String? password}) {
    showDialog(context: context!, builder: (context) => const LoaderWidget());

    var formData = {
      "username": username,
      "password": password,
    };

    ApiServices().apiLogin(formData).then((value) {
      Navigator.pop(context);

      if (value.status) {
        session.writeUserSession(value.user, password);

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      } else {
        showDialog(
            context: context, builder: (context) => ErrorDialog(value.message));
      }
    });
  }

  void logout() {
    session.removeUserSession();
  }

  void rememberCheck(RememberModel? remember) {
    session.writeRemember(remember);
  }

  void readRemember() {
    RememberModel remember = session.readRememberSession();
    rememberUser.value = remember.username ?? '';
    rememberPass.value = remember.password ?? '';
  }

  void rememberUncheck() {
    session.removeRememberSession();
  }
}

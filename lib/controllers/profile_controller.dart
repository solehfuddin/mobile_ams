part of 'controllers.dart';

class ProfileController extends GetxController {
  final session = SessionServices();
  Utils myUtils = Utils();
  late UserModel user;
  var loading = false.obs;
  var phoneNumber = "Not Set".obs;
  var emailAddress = "Not Set".obs;
  var photoUser = "".obs;
  var isCorrectEmail = true.obs;
  var isCorrectPassword = false.obs;
  var isMatchPassword = false.obs;
  var isCurrentPassword = true.obs;
  var isNewPassword = true.obs;
  var isRepeatPassword = true.obs;
  var isCorrectPhone = false.obs;

  ProfileController() {
    user = session.readUserSession();
    emailAddress.value = user.email ?? '';
    phoneNumber.value = user.phone ?? '';
    photoUser.value = user.userimg ?? '';
  }

  void checkPhone(String? phone) {
    phone != null
        ? phone.isEmpty
            ? isCorrectPhone.value = false
            : phone.length > 10
                ? isCorrectPhone.value = myUtils.isValidPhone(phone)
                : isCorrectPhone.value = false
        : isCorrectPhone.value = false;
  }

  void checkEmailAddress(String? email) {
    email != null
        ? email.isEmpty
            ? isCorrectEmail.value = false
            : isCorrectEmail.value = myUtils.isValidEmail(email)
        : isCorrectEmail.value = false;
  }

  void checkCurrentPassword(String? password) {
    password != null
        ? password.isEmpty
            ? isCurrentPassword.value = false
            : isCurrentPassword.value = true
        : isCurrentPassword.value = false;
  }

  void checkNewPassword(String? newPassword) {
    newPassword != null
        ? newPassword.isEmpty
            ? isNewPassword.value = false
            : isNewPassword.value = true
        : isNewPassword.value = false;
  }

  void checkRepeatPassword(String? repeatPassword) {
    repeatPassword != null
        ? repeatPassword.isEmpty
            ? isRepeatPassword.value = false
            : isRepeatPassword.value = true
        : isRepeatPassword.value = false;
  }

  void checkPassword(String? password) {
    user = session.readUserSession();
    password != null
        ? password.isEmpty
            ? isCorrectPassword.value = false
            : user.password == password
                ? isCorrectPassword.value = true
                : isCorrectPassword.value = false
        : isCorrectPassword.value = false;
  }

  void matchPassword(String newPassword, String repeatPassword) {
    newPassword.isEmpty && repeatPassword.isEmpty
        ? isMatchPassword.value = false
        : newPassword == repeatPassword
            ? isMatchPassword.value = true
            : isMatchPassword.value = false;
  }

  void changePassword(BuildContext context, String currentPassword,
      String newPassword, String repeatPassword) {
    showDialog(context: context, builder: (context) => const LoaderWidget());

    var formData = {
      "user_id": user.userId,
      "username": "",
      "password": newPassword,
      "password_conf": repeatPassword,
      "fullname": user.fullname,
      "nik": user.nik,
      "level": user.level,
      "email": "",
      "user_update": "SYSTEM",
    };

    checkCurrentPassword(currentPassword);
    checkNewPassword(newPassword);
    checkRepeatPassword(repeatPassword);

    if (isCurrentPassword.isTrue &&
        isNewPassword.isTrue &&
        isRepeatPassword.isTrue) {
      checkPassword(currentPassword);
      if (isCorrectPassword.isTrue) {
        matchPassword(newPassword, repeatPassword);
        if (isMatchPassword.isTrue) {
          ApiServices().apiUpdateUser(formData).then((value) {
            Navigator.pop(context);

            if (value.status ?? false) {
              session.writePasswordSession(newPassword);

              showDialog(
                context: context,
                builder: (context) => SuccessDialog(
                  value.message,
                ),
              ).then(
                (value) => Navigator.pop(context),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => ErrorDialog(value.message ?? ''),
              );
            }
          });
        } else {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) =>
                ErrorDialog("New password and repeat password doest not match"),
          );
        }
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => ErrorDialog("Current password is not correct"),
        );
      }
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => ErrorDialog("Please complete data !"),
      );
    }
  }

  void changeEmail(BuildContext context, String currentPassword, String email) {
    showDialog(context: context, builder: (context) => const LoaderWidget());

    var formData = {
      "user_id": user.userId,
      "username": "",
      "password": "",
      "password_conf": "",
      "fullname": user.fullname,
      "nik": user.nik,
      "level": user.level,
      "email": email,
      "user_update": "SYSTEM",
    };

    checkEmailAddress(email);
    checkCurrentPassword(currentPassword);

    if (isCorrectEmail.isTrue && isCurrentPassword.isTrue) {
      checkPassword(currentPassword);
      if (isCorrectPassword.isTrue) {
        ApiServices().apiUpdateUser(formData).then((value) {
          Navigator.pop(context);

          if (value.status ?? false) {
            emailAddress.value = email;
            session.writeEmailSession(email);

            showDialog(
              context: context,
              builder: (context) => SuccessDialog(
                value.message,
              ),
            ).then(
              (value) => Navigator.pop(context),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => ErrorDialog(value.message ?? ''),
            );
          }
        });
      } else {
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) => ErrorDialog("Current password is not correct"),
        );
      }
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => ErrorDialog("Please complete data !"),
      );
    }
  }

  void changeProfile(BuildContext context, String phone, String address) {
    showDialog(context: context, builder: (context) => const LoaderWidget());

    var formData = {
      "technician_id": user.technicianId,
      "name": user.fullname,
      "phone_number": phone,
      "area_code": "62",
      "address": address,
      "nik": user.nik,
      "user_input": "SYSTEM",
      "user_update": "SYSTEM",
    };

    checkPhone(phone);

    if (isCorrectPhone.isTrue) {
      ApiServices().apiUpdateTechnisian(formData).then((value) {
        Navigator.pop(context);

        if (value.status ?? false) {
          phoneNumber.value = phone;
          session.writePhoneSession(phone);

          showDialog(
            context: context,
            builder: (context) => SuccessDialog(
              value.message,
            ),
          ).then(
            (value) => Navigator.pop(context),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => ErrorDialog(value.message ?? ''),
          );
        }
      });
    } else {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => ErrorDialog("Wrong phone number"),
      );
    }
  }

  void changeLocation(double? latt, double? long) {
    var formData = {
      "user_id": user.userId,
      "username": "",
      "password": "",
      "password_conf": "",
      "fullname": user.fullname,
      "nik": user.nik,
      "level": user.level,
      "lat": latt.toString(),
      "long": long.toString(),
      "user_update": "SYSTEM",
    };

    ApiServices().apiUpdateUser(formData).then((value) {
      if (value.status ?? false) {
        session.writeLocationSession(
          LocationModels(
            latt,
            long,
          ),
        );

        // print("Success");
      } else {
        // print("Failde");
      }
    });
  }

  void changeImage(String image) {
    var formData = {
      "user_id": user.userId,
      "username": "",
      "password": "",
      "password_conf": "",
      "fullname": user.fullname,
      "nik": user.nik,
      "level": user.level,
      "lat": "",
      "long": "",
      "user_image": image,
      "user_update": "SYSTEM",
    };

    ApiServices().apiUpdateUser(formData).then((value) {
      if (value.status ?? false) {
        var loginData = {
          "username": user.username,
          "password": user.password,
        };
        ApiServices().apiLogin(loginData).then((output) {
          if (output.status) {
            photoUser.value = output.user?.userimg ?? "";
            session.writeImageProfileSession(output.user?.userimg ?? "");
          }
        });
      } else {
        // print("Failde");
      }
    });
  }

  void takePicture() async {
    // XFile? imageList;
    ImagePicker picker = ImagePicker();

    try {
      await picker
          .pickImage(
            source: ImageSource.camera,
            imageQuality: 70,
            preferredCameraDevice: CameraDevice.front,
          )
          .then(
            (value) => changeImage(
              base64Encode(
                Io.File(value!.path).readAsBytesSync(),
              ),
            ),
          );
    } catch (e) {
      print(e);
    }
  }
}

part of 'pages.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _profileController = Get.put(ProfileController());
  final _currentPasswordText = TextEditingController();
  final _newPasswordText = TextEditingController();
  final _repeatPasswordText = TextEditingController();
  bool currentPassword = true;
  bool newPassword = true;
  bool repeatPassword = true;

  @override
  void initState() {
    super.initState();
    currentPassword = true;
    newPassword = true;
    repeatPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.maxFinite,
          height: double.infinity,
          padding: const EdgeInsets.only(
            top: 35,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Icon(Icons.arrow_back, size: 25),
                          onTap: () => Navigator.pop(context),
                        ),
                        const Text(
                          'Change Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Inter",
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Current Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: currentPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              currentPassword = !currentPassword;
                            });
                          },
                          icon: Icon(currentPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        errorText: _profileController.isCurrentPassword.isTrue
                            ? null
                            : "Please provide current password",
                      ),
                      controller: _currentPasswordText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'New Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: newPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              newPassword = !newPassword;
                            });
                          },
                          icon: Icon(newPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        errorText: _profileController.isNewPassword.isTrue
                            ? null
                            : "Please provide new password",
                      ),
                      controller: _newPasswordText,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Repeat New Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Inter",
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      obscureText: repeatPassword,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              repeatPassword = !repeatPassword;
                            });
                          },
                          icon: Icon(repeatPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        errorText: _profileController.isRepeatPassword.isTrue
                            ? null
                            : "Please provide repeat password",
                      ),
                      controller: _repeatPasswordText,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 60,
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _profileController.changePassword(
                            context,
                            _currentPasswordText.text,
                            _newPasswordText.text,
                            _repeatPasswordText.text,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          minimumSize: const Size(320, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        child: const Text(
                          'Update',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

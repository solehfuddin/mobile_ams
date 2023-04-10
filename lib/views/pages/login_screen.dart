part of 'pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _myController = Get.put(LoginController());
  final _usernameText = TextEditingController();
  final _passwordText = TextEditingController();
  bool? checkRemember = false;
  bool showPassword = true;
  String? fcmToken = "";

  @override
  void initState() {
    super.initState();
    showPassword = true;
    _myController.readRemember();
    _usernameText.text = _myController.rememberUser.value;
    _passwordText.text = _myController.rememberPass.value;

    if (_usernameText.text.isNotEmpty && _passwordText.text.isNotEmpty) {
      checkRemember = true;
    }

    generateToken();
  }

  generateToken() async {
    fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: "empty");
    // print(fcmToken);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: FractionalOffset.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 36,
                          right: 36,
                          top: 29,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 26,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Hi, Welcome!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Inter",
                                      fontSize: 24,
                                    ),
                                  ),
                                  Text(
                                    'Login to your experience now!',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: "Inter",
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              'assets/images/logo.png',
                              width: 70,
                              height: 70,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 56,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            labelText: 'Username',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            errorText: _myController.isUsername.isTrue
                                ? null
                                : "Please provide username",
                          ),
                          keyboardType: TextInputType.name,
                          controller: _usernameText,
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: TextField(
                          obscureText: showPassword,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              icon: Icon(showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                            errorText: _myController.isPassword.isTrue
                                ? null
                                : "Please provide password",
                          ),
                          controller: _passwordText,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: checkRemember,
                                  onChanged: (value) {
                                    setState(() {
                                      checkRemember = value;
                                    });
                                  },
                                ),
                                const Text(
                                  'Remember Me',
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.only(
                            //     right: 14,
                            //   ),
                            //   child: GestureDetector(
                            //     onTap: () {
                            //       // Navigator.pushNamed(
                            //       //   context,
                            //       //   '/login',
                            //       // );
                            //     },
                            //     child: Text(
                            //       "Forgot Password",
                            //       style: TextStyle(
                            //         color: warningColor,
                            //         fontFamily: "Inter",
                            //         fontSize: 14,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 30,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            _myController.checkUsername(_usernameText.text);
                            _myController.checkPassword(_passwordText.text);

                            if (_myController.isUsername.isTrue &&
                                _myController.isPassword.isTrue) {
                              if (checkRemember!) {
                                _myController.rememberCheck(
                                  RememberModel(
                                    _usernameText.text,
                                    _passwordText.text,
                                  ),
                                );
                              } else {
                                _myController.rememberUncheck();
                              }

                              _myController.login(
                                context: context,
                                username: _usernameText.text,
                                password: _passwordText.text,
                                token: fcmToken,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            minimumSize: const Size(320, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8,
                              ),
                            ),
                          ),
                          child: const Text(
                            'Login',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

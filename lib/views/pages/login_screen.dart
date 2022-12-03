part of 'pages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? checkRemember = false;
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
    showPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: const TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
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
                        ),
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
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 14,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.pushNamed(
                                //   context,
                                //   '/login',
                                // );
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color: warningColor,
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          )
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
                          Navigator.pushNamed(
                            context,
                            '/home',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: mainColor,
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
            Positioned(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 46,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          fontFamily: "Inter",
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   '/login',
                          // );
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: blueAccent,
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

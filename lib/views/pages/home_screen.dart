part of 'pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.infinity,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            splashColor1.withOpacity(0),
            splashColor1.withOpacity(0.11),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 30,
                    height: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'PT ASIA MEGATAMA SEJAHTERA',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Inter",
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 47,
          ),
          Row(
            children: const [
              Text(
                'Good morning,',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                'Muhamad Solehfuddin',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Text(
            "Let's find your experience here!",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: "Inter",
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 148,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dashboard_complete.png',
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'Complete',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 148,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dashboard_process.png',
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'Process',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 22,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 148,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dashboard_waiting.png',
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'Waiting',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    width: 148,
                    height: 148,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dashboard_complain.png',
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'Complain',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Inter",
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

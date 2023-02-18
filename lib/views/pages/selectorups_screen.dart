part of 'pages.dart';

class SelectorupsScreen extends StatefulWidget {
  const SelectorupsScreen({Key? key}) : super(key: key);

  @override
  State<SelectorupsScreen> createState() => _SelectorupsScreenState();
}

class _SelectorupsScreenState extends State<SelectorupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/comingsoon.png',
              width: 128,
              height: 128,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Coming soon',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'wait, we are preparing this for \n you!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

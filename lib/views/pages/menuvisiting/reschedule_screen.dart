part of '../pages.dart';

class RescheduleScreen extends StatefulWidget {
  const RescheduleScreen({super.key});

  @override
  State<RescheduleScreen> createState() => _RescheduleScreenState();
}

class _RescheduleScreenState extends State<RescheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.infinity,
        padding: const EdgeInsets.only(
          top: 35,
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
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 10,
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
      ),
    );
  }
}

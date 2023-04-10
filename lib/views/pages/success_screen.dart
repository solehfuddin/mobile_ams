part of 'pages.dart';

// ignore: must_be_immutable
class SuccessScreen extends StatefulWidget {
  SuccessModels? success;
  SuccessScreen({this.success, Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
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
              'assets/images/complete.png',
              width: 128,
              height: 128,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.success!.title ?? "Success",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: "Inter",
                fontSize: 13,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.success!.description ?? "Data has been saved",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/home',
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                minimumSize: const Size(140, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              ),
              child: const Text(
                'OK, Back To Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Inter",
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

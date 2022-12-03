part of 'pages.dart';

class TechnisianScreen extends StatefulWidget {
  const TechnisianScreen({Key? key}) : super(key: key);

  @override
  State<TechnisianScreen> createState() => _TechnisianScreenState();
}

class _TechnisianScreenState extends State<TechnisianScreen> {
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
          children: const [
            Text(
              'AREA LIST TEKNISI',
            )
          ],
        ),
      ),
    );
  }
}

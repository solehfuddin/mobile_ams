part of 'pages.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pos = 0;

  void _onData(int pos) {
    setState(() {
      this.pos = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pos == 1
              ? const TechnisianScreen()
              : pos == 2
                  ? const HistoryScreen()
                  : pos == 3
                      ? const AccountScreen()
                      : const HomeScreen(),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CustomNavigation(
                _onData,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

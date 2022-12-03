part of 'widgets.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            30,
          ),
          topLeft: Radius.circular(
            30,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_dashboard_active.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_dashboard_active.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Technisian',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_dashboard_active.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'History',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_dashboard_active.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

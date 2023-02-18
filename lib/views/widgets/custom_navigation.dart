part of 'widgets.dart';

// ignore: must_be_immutable
class CustomNavigation extends StatefulWidget {
  final void Function(int) onData;
  const CustomNavigation(this.onData, {Key? key}) : super(key: key);

  @override
  State<CustomNavigation> createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation> {
  int pos = 0;

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
              onTap: () {
                setState(() {
                  pos = 0;
                });

                widget.onData(0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pos == 0
                        ? 'assets/images/ic_dashboard_active.png'
                        : 'assets/images/ic_dashboard_inactive.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: pos == 0
                          ? mainColor
                          : mainColor.withOpacity(
                              0.5,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pos = 1;
                });

                widget.onData(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pos == 1
                        ? 'assets/images/ic_visit_active.png'
                        : 'assets/images/ic_visit_inactive.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Visit List',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: pos == 1
                          ? mainColor
                          : mainColor.withOpacity(
                              0.5,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pos = 2;
                });

                widget.onData(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pos == 2
                        ? 'assets/images/ic_ups_active.png'
                        : 'assets/images/ic_ups_inactive.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Selector',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: pos == 2
                          ? mainColor
                          : mainColor.withOpacity(
                              0.5,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  pos = 3;
                });

                widget.onData(3);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    pos == 3
                        ? 'assets/images/ic_account_active.png'
                        : 'assets/images/ic_account_inactive.png',
                    width: 24,
                    height: 24,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: "Inter",
                      fontSize: 14,
                      color: pos == 3
                          ? mainColor
                          : mainColor.withOpacity(
                              0.5,
                            ),
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

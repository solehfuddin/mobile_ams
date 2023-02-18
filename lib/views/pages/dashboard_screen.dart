part of 'pages.dart';

const locationBackground = "location";
var notif = NotificationServices();
void callbackDispatcher() {
  // final profileController = Get.put(ProfileController());
  // final session = SessionServices();

  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case locationBackground:
        // print("Native called background task: $locationBackground");
        Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        notif.showNotificationWithoutSound(pos);
        // print("Your location : ${pos.latitude} , ${pos.longitude}");

        // session.writeLocationSession(
        //   LocationModels(
        //     pos.latitude,
        //     pos.longitude,
        //   ),
        // );
        // profileController.changeLocation(
        //   pos.latitude,
        //   pos.longitude,
        // );
        break;
    }
    return Future.value(true);
  });
}

// ignore: must_be_immutable
class DashboardScreen extends StatefulWidget {
  UserModel? user;
  DashboardScreen({this.user, Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _profileController = Get.put(ProfileController());
  int pos = 0;
  var location = LocationServices();
  LocationModels output = LocationModels(0, 0);
  StreamSubscription<Position>? positionStream;
  final session = SessionServices();

  void _onData(int pos) {
    setState(() {
      this.pos = pos;
    });
  }

  @override
  void dispose() {
    super.dispose();
    positionStream?.cancel();
  }

  @override
  void initState() {
    super.initState();

    location.getLocation(context).then((value) => setState((() {
          output = value;

          Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
          // Workmanager().registerOneOffTask("1", locationBackground);

          Workmanager().registerPeriodicTask(
            "1",
            locationBackground,
            frequency: const Duration(
              minutes: 15,
            ),
          );

          listenOnLocationChanges();
        })));
  }

  void listenOnLocationChanges() {
    const LocationSettings settings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    positionStream =
        Geolocator.getPositionStream(locationSettings: settings).listen(
      (event) {
        setState(
          () {
            output = LocationModels(
              event.latitude,
              event.longitude,
            );
            session.writeLocationSession(
              output,
            );
            _profileController.changeLocation(
              event.latitude,
              event.longitude,
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pos == 1
              ? const VisitingScreen()
              : pos == 2
                  ? const SelectorupsScreen()
                  : pos == 3
                      ? ProfileScreen(
                          user: widget.user,
                        )
                      : HomeScreen(
                          output,
                          user: widget.user,
                        ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: CustomNavigation(
                _onData,
              ),
            ),
          ),
          Positioned(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 45,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/visiting',
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: mainColor,
                      ),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1.5,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Image.asset(
                      'assets/images/ic_notification.png',
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

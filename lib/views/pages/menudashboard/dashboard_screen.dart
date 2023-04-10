part of '../pages.dart';

const locationBackground = "location";
var notif = NotificationServices();
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case locationBackground:
        // print("Native called background task: $locationBackground");
        Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
        );
        notif.showNotificationWithoutSound(pos);
        // print("Your location : ${pos.latitude} , ${pos.longitude}");
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
  final AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: "Description",
    importance: Importance.high,
    playSound: true,
  );
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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

          Workmanager().initialize(callbackDispatcher, isInDebugMode: false);
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

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      '2',
      'fcm-bg',
      channelDescription: 'fetch location in background',
      playSound: false,
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails(presentSound: false);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    //On App Open
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification!;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        platformChannelSpecifics,
        payload: '',
      );
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // print('A new messageopen app event was published');
      // RemoteNotification notification = message.notification!;
      // showDialog(
      //     context: context,
      //     builder: (_) {
      //       return AlertDialog(
      //         title: Text(notification.title!),
      //         content: SingleChildScrollView(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [Text(notification.body!)],
      //           ),
      //         ),
      //       );
      //     });

      Navigator.pushNamed(
        context,
        '/process',
      );
    });
  }

  void listenOnLocationChanges() {
    const LocationSettings settings = LocationSettings(
      accuracy: LocationAccuracy.best,
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
              ? VisitingScreen(
                  user: widget.user,
                )
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
                      '/notification',
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
                          offset: const Offset(
                            0,
                            2,
                          ),
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

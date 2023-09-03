part of '../pages.dart';

// ignore: must_be_immutable
class MapsScreen extends StatefulWidget {
  TroubleModel? trouble;
  MapsScreen({this.trouble, Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final _mapController = Get.put(MapsController());
  final Completer<GoogleMapController> _controller = Completer();
  late LatLng sourceLoc, targetLoc;
  double distanceInMeters = 0;

  List<LatLng> polylineCoordinates = [];
  var location = LocationServices();
  LocationModels currentLocation = LocationModels(0, 0);
  StreamSubscription<Position>? positionStream;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor targetIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    GoogleMapController googleMapController = await _controller.future;

    // ignore: use_build_context_synchronously
    location.getLocation(context).then((value) {
      setState(() {
        currentLocation.latitude = value.latitude;
        currentLocation.longitude = value.longitude;
      });
    });

    const LocationSettings settings = LocationSettings(
      accuracy: LocationAccuracy.best,
      distanceFilter: 100,
    );

    positionStream =
        Geolocator.getPositionStream(locationSettings: settings).listen(
      (event) {
        currentLocation = LocationModels(
          event.latitude,
          event.longitude,
        );

        googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 13.5,
              target: LatLng(
                event.latitude,
                event.longitude,
              ),
            ),
          ),
        );

        setState(
          () {},
        );
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polyline = PolylinePoints();

    // sourceLoc = const LatLng(
    //   -6.1970946,
    //   106.9205639,
    // );
    // targetLoc = const LatLng(
    //   -6.2336932,
    //   106.9227771,
    // );

    sourceLoc = LatLng(
      double.parse(widget.trouble!.baseLatt ?? "0"),
      double.parse(widget.trouble!.baseLong ?? "0"),
    );
    targetLoc = LatLng(
      double.parse(widget.trouble!.latt ?? "0"),
      double.parse(widget.trouble!.long ?? "0"),
    );

    distanceInMeters = Geolocator.distanceBetween(
      double.parse(widget.trouble!.baseLatt ?? "0"),
      double.parse(widget.trouble!.baseLong ?? "0"),
      double.parse(widget.trouble!.latt ?? "0"),
      double.parse(widget.trouble!.long ?? "0"),
    );

    PolylineResult result = await polyline.getRouteBetweenCoordinates(
      googleMapsKey,
      PointLatLng(sourceLoc.latitude, sourceLoc.longitude),
      PointLatLng(targetLoc.latitude, targetLoc.longitude),
    );

    if (result.points.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }

  void setMarker() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/source.png",
    ).then(
      (value) => sourceIcon = value,
    );

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/destination.png",
    ).then(
      (value) => targetIcon = value,
    );

    BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      "assets/images/technician.png",
    ).then(
      (value) => currentIcon = value,
    );
  }

  @override
  void initState() {
    super.initState();
    setMarker();
    getCurrentLocation();
    getPolyPoints();
  }

  @override
  void dispose() {
    super.dispose();
    positionStream?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // ignore: unnecessary_null_comparison
        body: currentLocation == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: targetLoc,
                      zoom: 10.5,
                    ),
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId('routes'),
                        points: polylineCoordinates,
                        color: mainColor,
                        width: 6,
                      ),
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('current'),
                        icon: currentIcon,
                        position: LatLng(
                          currentLocation.latitude!,
                          currentLocation.longitude!,
                        ),
                      ),
                      Marker(
                        markerId: const MarkerId('source'),
                        icon: sourceIcon,
                        position: sourceLoc,
                      ),
                      Marker(
                        markerId: const MarkerId('target'),
                        icon: targetIcon,
                        position: targetLoc,
                      ),
                    },
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: false,
                    onMapCreated: (mapController) {
                      _controller.complete(mapController);
                    },
                  ),
                  _mapController.showContent.isTrue
                      ? Positioned(
                          bottom: 15,
                          left: 15,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 255,
                          left: 15,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                  _mapController.showContent.isTrue
                      ? Positioned(
                          bottom: 15,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.add,
                              ),
                              onPressed: () {
                                _mapController.showContent.value =
                                    !_mapController.showContent.value;
                              },
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 255,
                          right: 15,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.horizontal_rule_sharp,
                              ),
                              onPressed: () {
                                _mapController.showContent.value =
                                    !_mapController.showContent.value;
                              },
                            ),
                          ),
                        ),
                  _mapController.showContent.isTrue
                      ? Positioned(
                          bottom: 15,
                          right: 85,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.gps_fixed_sharp,
                              ),
                              onPressed: () {
                                getCurrentLocation();
                              },
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 255,
                          right: 85,
                          child: Container(
                            padding: const EdgeInsets.all(
                              2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.gps_fixed_sharp,
                              ),
                              onPressed: () {
                                getCurrentLocation();
                              },
                            ),
                          ),
                        ),
                  _mapController.showContent.isTrue
                      ? const SizedBox(width: 10)
                      : Positioned(
                          bottom: 0,
                          child: Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(
                                  30,
                                ),
                                topRight: Radius.circular(
                                  30,
                                ),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: _mapController.nextStep.isTrue
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Image.asset(
                                          "assets/images/complete.png",
                                          width: 130,
                                          height: 130,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          widget.trouble!.technicianName ?? '',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: "Inter",
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        const Text(
                                          'You are arrived',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Inter",
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            //eksekusi take picture
                                            _mapController.takePicture(
                                              context,
                                              widget.trouble,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: mainColor,
                                            minimumSize: const Size(130, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                30,
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            'Take A Picture',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: "Inter",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 20,
                                            bottom: 10,
                                          ),
                                          child: Text(
                                            widget.trouble!.technicianName ??
                                                '',
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: "Inter",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Status : ',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Inter",
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  Text(
                                                    'On the way',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: "Inter",
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                '${widget.trouble!.distance} Km',
                                                // '$distanceInMeters Km',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Inter",
                                                  fontSize: 24,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            color: splashColor1.withOpacity(
                                              0.25,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.trouble!.custName ?? '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Inter",
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                widget.trouble!.address ?? '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Inter",
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 5,
                                          ),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.trouble!.baseName ?? '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily: "Inter",
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 2,
                                              ),
                                              Text(
                                                widget.trouble!.baseAddress ??
                                                    '',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: "Inter",
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              _mapController
                                                  .updateStatusTrouble(
                                                context,
                                                widget.trouble,
                                                "",
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: mainColor,
                                              minimumSize: const Size(130, 40),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  30,
                                                ),
                                              ),
                                            ),
                                            child: const Text(
                                              'Confirm Arrive',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: "Inter",
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                ],
              ),
      ),
    );
  }
}

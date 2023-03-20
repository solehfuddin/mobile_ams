part of '../pages.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  var sourceLoc = const LatLng(37.33500926, -122.03272188);
  var targetLoc = const LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];

  void getPolyPoints() async {
    PolylinePoints polyline = PolylinePoints();

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

  @override
  void initState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: sourceLoc, zoom: 13.5),
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
                markerId: const MarkerId('source'),
                position: sourceLoc,
              ),
              Marker(
                markerId: const MarkerId('target'),
                position: targetLoc,
              ),
            },
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 60,
            right: 40,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

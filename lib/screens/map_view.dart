import 'package:digital_domi_assessment/constants/map_configs.dart';
import 'package:digital_domi_assessment/screens/home_overlay.dart';
import 'package:digital_domi_assessment/utils/widget_to_map_icon.dart';
import 'package:digital_domi_assessment/widgets/buttons.dart';
import 'package:digital_domi_assessment/widgets/cards.dart';
import 'package:digital_domi_assessment/widgets/markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapView extends StatefulWidget {
  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(MapConfig.initLat, MapConfig.initLng);
  final Set<Marker> _markers = {};
  Set<Polygon> _polygons = {};
  final String imageUrl = 'https://picsum.photos/seed/picsum/200/300';

  @override
  initState() {
    super.initState();
    _setCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: MapConfig.defaultZoom,
          ),
          zoomControlsEnabled: false,
          markers: _markers,
          polygons: _polygons,
          onTap: _handleTap,
        ),
        Positioned(
            width: MediaQuery.of(context).size.width,
            top: 64,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircularIconButton(
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {}),
                  const SizedBox(width: 40),
                  CustomInfoWindow(
                      title: "100 Martinique Ave",
                      imageUri: "https://picsum.photos/seed/picsum/200/300",
                      onPressed: () => showBottomSheet(context)),
                  const SizedBox(width: 40),
                  CircularIconButton(
                      icon: const Icon(
                        Icons.sms_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {})
                ],
              ),
            )),
      ],
    ));
  }

  void _onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(MapConfig.mapStyle);
    mapController = controller;
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
        barrierColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.black,
        useSafeArea: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return const HomeOverlay();
          });
        });
  }

  Future<void> _setCustomMarker() async {
    final customMarker =
        await CustomMarker(imageUrl: imageUrl).toBitmapDescriptor(
      logicalSize: const Size(60, 60),
      imageSize: const Size(120, 120),
    );

    setState(
      () {
        _markers.add(
          Marker(
            markerId: const MarkerId('customMarker'),
            position: _center,
            icon: customMarker,
          ),
        );
      },
    );
  }

  void _handleTap(LatLng point) {
    _showInviteDialog(context);
    setState(() {
      _polygons = {
        Polygon(
          polygonId: PolygonId(point.toString()),
          points: _generatePolygonPoints(point),
          strokeColor: Colors.transparent,
          fillColor: Colors.yellow,
        )
      };
    });
  }

  List<LatLng> _generatePolygonPoints(LatLng center) {
    double offset = 0.0001;
    return [
      LatLng(center.latitude + offset, center.longitude + offset),
      LatLng(center.latitude + offset, center.longitude - offset),
      LatLng(center.latitude - offset, center.longitude - offset),
      LatLng(center.latitude - offset, center.longitude + offset),
    ];
  }
}

Future<void> _showInviteDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, 
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      return const Dialog(
        insetPadding: EdgeInsets.all(16),
        alignment: Alignment.bottomCenter,
        backgroundColor: Colors.white,
        child: InviteCard(),
        
      );
    },
  );
}

class CustomInfoWindow extends StatelessWidget {
  final String title;
  final String imageUri;
  final VoidCallback onPressed;
  const CustomInfoWindow({
    super.key,
    required this.title,
    required this.imageUri,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 50,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage:
                    NetworkImage(imageUri), // Add your image asset here
                radius: 23,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

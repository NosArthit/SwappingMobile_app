import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _currentPosition = CameraPosition(
    target: LatLng(13.81885789938171, 100.53178481583411),
    zoom: 16,
  );

  static const CameraPosition _stationPosition = CameraPosition(
      target: LatLng(13.634522136559566, 101.10750791773651),
      tilt: 59.440717697143555,
      zoom: 16);

  Set<Polyline> _polylines = {};
  List<LatLng> polylineCoordinates = [];
  late Polyline _routePolyline;

  @override
  void initState() {
    super.initState();
    _fetchRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _currentPosition,
        polylines: _polylines,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToCurrent,
        label: const Text('Current Position'),
        icon: const Icon(Icons.bike_scooter),
      ),
    );
  }

  Future<void> _goToCurrent() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
  }

  Future<void> _fetchRoute() async {
    final response = await http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?origin=${_currentPosition.target.latitude},${_currentPosition.target.longitude}&destination=${_stationPosition.target.latitude},${_stationPosition.target.longitude}&key=AIzaSyDlYa9OAoE-oQk7klzyy2YvNK40nKi0Mlo'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> steps = data['routes'][0]['legs'][0]['steps'];

      polylineCoordinates.clear();
      for (var step in steps) {
        polylineCoordinates.add(LatLng(step['start_location']['lat'], step['start_location']['lng']));
        polylineCoordinates.add(LatLng(step['end_location']['lat'], step['end_location']['lng']));
      }

      setState(() {
        _routePolyline = Polyline(
          polylineId: PolylineId('route'),
          color: Colors.lightGreenAccent,
          width: 5,
          points: polylineCoordinates,
        );
        _polylines.add(_routePolyline);
      });
    } else {
      throw Exception('Failed to load directions');
    }
  }
}






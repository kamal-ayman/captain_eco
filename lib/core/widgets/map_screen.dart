// ignore_for_file: must_be_immutable
import 'dart:ui' as ui;
import 'dart:async';
import 'package:captain_eco/core/models/map_functions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:icons_plus/icons_plus.dart';

class MapScreen extends StatefulWidget {
  bool chkCurrent;
  double? height;
  bool disableMarker;
  LatLng? latlong;
  String? AdsOwner;
  double? zoom;
  bool currentLocation;

  MapScreen({this.latlong, this.AdsOwner, this.chkCurrent = false, this.disableMarker = false, this.height, this.zoom, this.currentLocation = false, Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? latlong;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          alignment: Alignment.center,
          width: size.width,
          height: widget.height ?? 200.0,
          child: GoogleMap(
            mapType: MapType.normal,
            // polylines: Set<Polyline>.of([
            //   Polyline(
            //       polylineId: PolylineId('route'),
            //       visible: true,
            //       points: [
            //         latlong!,
            //         for (int i = 0; i < 10; i++)
            //           LatLng(latlong!.latitude + 0.001 * i, latlong!.longitude + 0.001 * i / 2),
            //       ],
            //       color: Colors.blue,
            //       width: 5),
            //   Polyline(
            //       polylineId: PolylineId('route1'),
            //       visible: true,
            //       points: [
            //         latlong!,
            //         for (int i = 0; i < 10; i++)
            //           LatLng(latlong!.latitude + (0.001 * i), latlong!.longitude + 0.001 * i),
            //       ],
            //       color: Colors.blue,
            //       width: 5),
            // ]),
            // myLocationEnabled: true,
            onCameraMove: (CameraPosition position) {
              // print(position.target.latitude);
              //pick current location
              // setState(() {
              // _centerLocation = position.target;
              // });
            },
            minMaxZoomPreference: const MinMaxZoomPreference(8.0, 20.0),
            polygons: Set<Polygon>.of([
              Polygon(
                  polygonId: PolygonId('route'),
                  visible: true,
                  points: [
                    latlong!,
                    for (int i = 0; i < 10; i++) LatLng(latlong!.latitude + 0.001 * i, latlong!.longitude + 0.001 * i / 2),
                  ],
                  fillColor: Colors.blue.withOpacity(0.5),
                  strokeColor: Colors.blue,
                  strokeWidth: 5),
              Polygon(
                  polygonId: PolygonId('route1'),
                  visible: true,
                  points: [
                    latlong!,
                    for (int i = 0; i < 10; i++) LatLng(latlong!.latitude + (0.001 * i), latlong!.longitude + 0.001 * i),
                  ],
                  fillColor: Colors.blue.withOpacity(0.5),
                  strokeColor: Colors.blue,
                  strokeWidth: 5),
            ]),
            circles: Set<Circle>.of([
              Circle(circleId: CircleId('route'), visible: true, center: latlong!, radius: 1000, fillColor: Colors.green.withOpacity(0.5), strokeColor: Colors.green, strokeWidth: 1),
              Circle(circleId: CircleId('route1'), visible: true, center: latlong!, radius: 500, fillColor: Colors.blue.withOpacity(0.5), strokeColor: Colors.blue, strokeWidth: 5),
            ]),
            zoomControlsEnabled: false,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            onCameraIdle: () => setState(() {}),
            initialCameraPosition: _cameraPosition!,
            mapToolbarEnabled: false,
            buildingsEnabled: false,
            markers: {
              if (_origin != null) _origin!,
            },
            onMapCreated: (GoogleMapController controller) {
              _googleMapController = (controller);
              _googleMapController!.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
            },
            onTap: _addMarker,
          ),
        ),
        if (widget.chkCurrent)
          AnimatedPadding(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.only(top: widget.height! - 100.h, right: 10.w),
            child: Container(
              width: 45.w,
              height: 50.h,
              child: FloatingActionButton(
                backgroundColor: Color.fromARGB(195, 255, 255, 255),
                onPressed: () async {
                  Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
                  latlong = new LatLng(currentPosition.latitude, currentPosition.longitude);
                  _addMarker(latlong!);
                  _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: latlong!,
                    zoom: widget.zoom ?? 15,
                    tilt: 0,
                  )));
                },
                child: const Icon(Icons.location_on_outlined),
              ),
            ),
          ),
      ],
    );
  }

  @override
  void initState() {
    latlong = new LatLng(0, 0);
    _cameraPosition = CameraPosition(target: latlong!, zoom: widget.zoom ?? 10);
    print('latlong');
    if (widget.latlong != null) _addMarker(widget.latlong!);
    if (widget.latlong != null) _cameraPosition = CameraPosition(target: widget.latlong!, zoom: widget.zoom ?? 10);
    _determinePosition();
    super.initState();
  }

  void dispose() {
    // _googleMapController!.dispose();
    super.dispose();
  }

  CameraPosition? _cameraPosition;
  GoogleMapController? _googleMapController;
  Marker? _origin;

  // getPolylines() async {
  //   var response = await http.get(
  //       Uri.parse('https://maps.googleapis.com/maps/api/directions/json?origin=$pickLat%2C$pickLng&destination=$dropLat%2C$dropLng&avoid=ferries|indoor&transit_mode=bus&mode=driving&key=$mapkey'));
  //   if (response.statusCode == 200) {
  //     var steps = jsonDecode(response.body)['routes'][0]['overview_polyline']['points'];
  //     decodeEncodedPolyline(steps);
  //   } else {
  //     debugPrint(response.body);
  //   }
  //   return polyList;
  // }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  Future<void> _addMarker(LatLng pos) async {
    final Uint8List markerIcon = await getBytesFromAsset('assets/images/map/pointer.png', 100);
    var pinLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    // final Uint8List bikeIcons = await getBytesFromAsset('assets/images/bike.png', 60);
    // var bikeIcon = BitmapDescriptor.fromBytes(bikeIcons);

    if (widget.latlong != null && widget.AdsOwner != null) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId(widget.AdsOwner!),
          infoWindow: InfoWindow(title: widget.AdsOwner),
          icon: pinLocationIcon,
          position: widget.latlong!,
        );
        print("'newElse'${MapClass.latitude}");
        print("'newElse'${MapClass.longitude}");
      });
      return;
    }
    if (_origin != null) {
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(title: 'Current'),
          icon: pinLocationIcon,
          flat: true,
          position: pos,
        );

        MapClass.latitude = pos.latitude.toString();
        MapClass.longitude = pos.longitude.toString();
      });
    } else {
      setState(() {
        _origin = Marker(
          markerId: MarkerId('origin'),
          infoWindow: InfoWindow(title: 'current'),
          icon: pinLocationIcon,
          position: pos,
        );

        print("'newElse'${MapClass.latitude}");
        print("'newElse'${MapClass.longitude}");
      });
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (_googleMapController != null) _googleMapController!.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
    setState(() {
      MapClass.latitude = currentPosition.latitude.toString();
      MapClass.longitude = currentPosition.longitude.toString();
      print("'init'${MapClass.latitude}");
      print("'init'${MapClass.longitude}");
      print(widget.latlong);
      if (widget.latlong == null) {
        latlong = new LatLng(currentPosition.latitude, currentPosition.longitude);
        _cameraPosition = CameraPosition(target: latlong!, zoom: widget.zoom ?? 10);
        if (_googleMapController != null) _googleMapController!.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
        print(latlong);
        _addMarker(latlong!);
      } else {
        latlong = widget.latlong;
        _cameraPosition = CameraPosition(target: latlong!, zoom: widget.zoom ?? 10);
        if (_googleMapController != null) _googleMapController!.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition!));
        _addMarker(latlong!);
      }
    });
    return currentPosition;
  }
}


import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'as geocoding;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationHelper with ChangeNotifier {

  Position? position;
  LatLng? startLocation;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  CameraPosition? cameraPosition;
  GoogleMapController? mapController;


  //
  String btnText = "Allow Location Access";
  checkPermissionStatus() async{
    var status = await Permission.locationWhenInUse.status;
    if (status != PermissionStatus.granted) {
      //show Dialog or route to specific page (or route to Application Manager)
      btnText = "Allow Location Access";
    }else{
      btnText = "Get My Location";
      // Go to Second Screen
    }
    notifyListeners();
  }


  getGeoLocationPosition({bool? isFirstTime=false,BuildContext? context}) async {
    bool serviceEnabled;
    LocationPermission permission;
    markers.clear();
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
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
    print('positionss');
    await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
        forceAndroidLocationManager: false)
        .then((position) {
      this.position = position;
      getAddressFromLatLong(p:position,isFirstTime: isFirstTime!,context: context);

    //  notifyListeners();
      return null;
    });
  }
  //
  Future<void> getAddressFromLatLong({Position? p,bool isFirstTime = false,BuildContext? context}) async {
    print('sdsadd ${p!.latitude} ${p.longitude}');
    position = p;
    startLocation = LatLng(position!.latitude, position!.longitude);
    cameraPosition = CameraPosition(
        target:
        LatLng(31.975697,35.8594),
        zoom: 18.0);
    List<geocoding.Placemark>? placemarks;
    placemarks = await geocoding.GeocodingPlatform.instance.placemarkFromCoordinates(
        31.975697,
        35.8594,
        localeIdentifier: "en"
    );
    address ="${placemarks[0].street}, ${placemarks[0].locality}, ${placemarks[0].country}";
       address2 = "${placemarks[0].street}, ${placemarks[0].locality}";
    _isLoading = false;
    notifyListeners();
  }

  final searchLocationController = TextEditingController();
  bool showClearButton = false;
  bool onSelect = false;
  getLatLng(query) async {
// From a query
    List<geocoding.Location> locations = await geocoding.locationFromAddress(query);
    var first = locations.first;
    print("${first.latitude} : ${first.longitude}");
    CameraPosition position1 = CameraPosition(target: LatLng(31.975697,35.8594), zoom: 16.0,);
    GoogleMapController? controller = mapController;
    controller!.animateCamera(CameraUpdate.newCameraPosition(position1));
    List<geocoding.Placemark>? placemarks;
    placemarks = await geocoding.GeocodingPlatform.instance.placemarkFromCoordinates(
        position1.target.latitude,
        position1.target.longitude,
        localeIdentifier: "en"
    );
    address ="${placemarks[0].street}, ${placemarks[0].locality}, ${placemarks[0].country}";
    notifyListeners();
  }


  Future<void> getCurrentPosition() async{
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high,)
        .then((Position position) async {
      markers.clear();
      CameraPosition position1 = CameraPosition(target: LatLng(position.latitude,position.longitude), zoom: 16.0,);
      GoogleMapController? controller = mapController;
      controller!.animateCamera(CameraUpdate.newCameraPosition(position1));
    }).catchError((e) {
      print(e);
    });
    notifyListeners();
  }

  String address = '';
  String address2 = '';
  geocoding.Placemark? place;
  bool isLoadingAdd = false;

  Set<Marker> markers = HashSet<Marker>();
  BitmapDescriptor? markerIcon;
  final int _markerIdCounter = 1;
  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    //   _markerIdCounter++;
    //  print('Marker | Latitude: ${point.latitude}  Longitude: ${point.longitude}');
    markers.add(Marker(markerId: const MarkerId("1"), position: point,icon: markerIcon!));
    notifyListeners();
  }

  void setMarkerIcon() async {
    markerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/icons/marker.png');
    notifyListeners();
  }


  clearLocationHelper(){
    markers.clear();
  }
}

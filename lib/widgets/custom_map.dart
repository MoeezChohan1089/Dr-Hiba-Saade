
import 'package:drhibasaade/provider/location_helper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class CustomMap extends StatelessWidget {
  LocationHelper? locationHelper;
  Position? position ;
   CustomMap({
     this.locationHelper,
     this.position,
     Key? key}) : super(key: key);
  LatLng? latLng;

  CameraPosition? cameraPosition;
  GoogleMapController? mapController;

  bool isLoading = false;
  bool cameraMove = false;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:locationHelper!.cameraPosition!,
              // CameraPosition(
              //   target: widget.locationHelper!.startLocation!,
              //   zoom: 16.0,),
              mapType: MapType.normal,
              onMapCreated: (controller) {
                locationHelper!.mapController = controller;
               // setState((){});
              },
              myLocationEnabled: false,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
               compassEnabled: true,
               indoorViewEnabled: true,
              scrollGesturesEnabled: true,
              // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height-120,left: 10),
              onCameraMove: (CameraPosition position) {
                cameraMove =true;
                cameraPosition = position;
              },
              onCameraIdle: () async {
                locationHelper!.getAddressFromLatLong(
                    Position(
                    longitude: cameraPosition!.target.longitude,
                    latitude: cameraPosition!.target.latitude,
                    timestamp: DateTime.now(),
                    accuracy: 0,
                    altitude: 1,
                    heading: 0,
                    speed: 0,
                    speedAccuracy: 1));
              },
           //   markers: locationHelper!.markers,
            ),
         //   Center(child: Image.asset("assets/icons/marker.png",scale: 3,)),
          ])

    );
  }
}

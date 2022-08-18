import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';

class MapController extends GetxController {
  late CameraPosition cameraPosition;
  late GoogleMapController googleMapController;
  Set<Marker> mark = <Marker>[].toSet();
  late LatLng currentLatLng;
  late LatLng latLong;

  @override
  void onInit() async {
    cameraPosition = CameraPosition(target: LatLng(31.5298725, 34.4557746), zoom: 16);
    await getCurrentLocation();
    super.onInit();
  }

  void addMarker(LatLng latLng) {
    mark.clear();
    var marker = Marker(
        markerId: MarkerId('Marker ${mark.length}'),
        position: latLng,
        infoWindow: InfoWindow(title: 'Marker'));
    mark.add(marker);
    update();
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition();
    currentLatLng = LatLng(position.latitude, position.longitude);
    print(position.latitude.toString() + "   " + position.longitude.toString());
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        cameraPosition = CameraPosition(target: currentLatLng, zoom: 16),
      ),
    );
    print('getCurrentLocation');
    update();
  }

  void onMapClick(LatLng latLng) {
    addMarker(latLng);
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 16),
      ),
    );
    latLong = latLng;
  }

  Future<String> getAddressFromLatLong(LatLng position) async {
    List placeMarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placeMarks);
    Placemark place = placeMarks[0];
    return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  Future<void> onSelectAddressClick() async {
    if (mark.isEmpty) {
      latLong = currentLatLng;
    }
    String address = await getAddressFromLatLong(latLong);
    SharedPreferencesController().setAddress(address);
    SharedPreferencesController().setLatitude(latLong.latitude.toString());
    SharedPreferencesController().setLongitude(latLong.longitude.toString());
    Get.back();
  }
}

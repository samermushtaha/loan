import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';

class MapController extends GetxController {
  late CameraPosition cameraPosition;
  late GoogleMapController googleMapController;
  Set<Marker> mark = <Marker>[].toSet();
  late LatLng currentLatLng = const LatLng(48.8566, 2.3522);
  String selectedLocation = '';
  late LatLng latLnge;
  // late List<Address> addresses;
  // late Address address;

  @override
  void onInit() {
    cameraPosition = CameraPosition(target: LatLng(31.350556, 34.452679), zoom: 16);
    _determinePosition();
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

  Future<void> _determinePosition() async {
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
        CameraPosition(target: currentLatLng, zoom: 16),
      ),
    );
    update();
  }

  void onMapClick(LatLng latLng){
    addMarker(latLng);
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 16),
      ),
    );
    latLnge = latLng;
    selectedLocation = latLng.toString();
  }

  Future<void> onSelectAddressClick() async{
    // final coordinates = new Coordinates(latLnge.latitude, latLnge.longitude);
    // addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    // address = addresses.first;
    // print("${address.featureName} : ${address.addressLine}");
    SharedPreferencesController().setAddress(selectedLocation);
    Get.back();
  }

}

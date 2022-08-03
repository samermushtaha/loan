import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  MapScreen({Key? key}) : super(key: key);

  MapController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'select_address'.tr,
          style: TextStyle(
              color: context.theme.textTheme.headline2!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.large),
        ),
        elevation: 0,
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(onPressed: (){_controller.onSelectAddressClick();}, icon: Icon(Icons.check))
        ],
      ),
      body: GetBuilder<MapController>(builder: (controller) {
        return GoogleMap(
          onTap: (LatLng latLng) {
            _controller.onMapClick(latLng);
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.googleMapController = controller;
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          initialCameraPosition: controller.cameraPosition,
          mapType: MapType.normal,
          markers: controller.mark,
        );
      }),
    );
  }
}

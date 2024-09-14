import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseAddressManuallyScreen extends StatefulWidget {
  const ChooseAddressManuallyScreen({super.key});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.43296265331129, 31.08832357078792),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(30.43296265331129, 31.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  State<ChooseAddressManuallyScreen> createState() =>
      _ChooseAddressManuallyScreenState();
}

class _ChooseAddressManuallyScreenState
    extends State<ChooseAddressManuallyScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Select your location',
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        body: GoogleMap(
          markers: marker,
          onTap: (argument) {
            setState(() {
              marker.add(Marker(
                markerId: const MarkerId('1'),
                position: argument,
              ));
            });
          },
          mapType: MapType.normal,
          initialCameraPosition: ChooseAddressManuallyScreen._kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: CustomButton(
            isPadding: true,
            text: 'Continue',
            onTap: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.isPadding = false,
    required this.text,
    this.onTap,
  });

  bool isPadding;
  void Function()? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        height: screenSize.height * .06,
        margin: isPadding == true
            ? EdgeInsets.symmetric(
                horizontal: screenSize.width * .04,
              )
            : null,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffFF6100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                text,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _controller;
  LatLng _selectedLocation = LatLng(37.4219999, -122.0840575);
  String _address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map')),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _selectedLocation,
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId('selected-location'),
                  position: _selectedLocation,
                  draggable: true,
                  onDragEnd: (newPosition) {
                    setState(() {
                      _selectedLocation = newPosition;
                    });
                    _getAddressFromLatLng(_selectedLocation);
                  },
                ),
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Address: $_address'),
          ),
        ],
      ),
    );
  }

  void _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          _address = '${place.street}, ${place.locality}, ${place.country}';
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
 */
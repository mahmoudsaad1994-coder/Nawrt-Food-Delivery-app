import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({super.key});

  @override
  OrderTrackingState createState() => OrderTrackingState();
}

class OrderTrackingState extends State<OrderTracking> {
  final Completer<GoogleMapController> _controller = Completer();
  final Location _location = Location();

  // موقع المندوب (افتراضيًا)
  LatLng _deliveryPersonLocation = const LatLng(30.0444, 31.2357); // القاهرة

  // موقع العميل (ثابت)
  final LatLng _customerLocation = const LatLng(30.0626, 31.2497); // مكان آخر

  // إعداد Marker للمندوب والعميل
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _setInitialMarkers();
    _trackDeliveryPerson();
  }

  void _setInitialMarkers() {
    _markers = {
      Marker(
        markerId: const MarkerId("delivery_person"),
        position: _deliveryPersonLocation,
        infoWindow: const InfoWindow(title: "موقع المندوب"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
      ),
      Marker(
        markerId: const MarkerId("customer"),
        position: _customerLocation,
        infoWindow: const InfoWindow(title: "موقع العميل"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    };
  }

  void _trackDeliveryPerson() async {
    _location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        _deliveryPersonLocation = LatLng(
          currentLocation.latitude!,
          currentLocation.longitude!,
        );

        // تحديث Marker المندوب
        _markers.removeWhere((m) => m.markerId.value == "delivery_person");
        _markers.add(
          Marker(
            markerId: const MarkerId("delivery_person"),
            position: _deliveryPersonLocation,
            infoWindow: const InfoWindow(title: "موقع المندوب"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
          ),
        );
      });

      // تحريك الكاميرا لموقع المندوب
      _moveCameraToLocation(_deliveryPersonLocation);
    });
  }

  void _moveCameraToLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLng(location));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تتبع الطلب"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _deliveryPersonLocation,
          zoom: 14,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

class MyLocationWithMap extends StatefulWidget {
  const MyLocationWithMap({super.key});

  @override
  State<MyLocationWithMap> createState() => _MyLocationWithMapState();
}

class _MyLocationWithMapState extends State<MyLocationWithMap> {
  static const String googleApiKey = "AIzaSyDH4Y9rnt-Ui5FGTT5G1ivY2tlNFc9jrAo";
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(30.0444, 31.2357);
  Marker? _selectedMarker;
  String _selectedAddress = "حدد موقعًا على الخريطة";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("اختر موقعك"),
      ),
      body: Column(
        children: [
          // البحث عن المواقع
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              readOnly: true,
              onTap: () async {
                Prediction? prediction = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleApiKey,
                  language: "ar",
                  components: [
                    Component(Component.country, "eg")
                  ], // تخصيص الدولة
                );
                if (prediction != null) {
                  GoogleMapsPlaces places =
                      GoogleMapsPlaces(apiKey: googleApiKey);
                  PlacesDetailsResponse detail =
                      await places.getDetailsByPlaceId(prediction.placeId!);
                  final lat = detail.result.geometry!.location.lat;
                  final lng = detail.result.geometry!.location.lng;

                  setState(() {
                    _currentPosition = LatLng(lat, lng);
                    _selectedAddress = detail.result.formattedAddress!;
                    _selectedMarker = Marker(
                      markerId: const MarkerId("selectedLocation"),
                      position: _currentPosition,
                    );
                  });
                  _mapController?.animateCamera(
                    CameraUpdate.newLatLng(_currentPosition),
                  );
                }
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "ابحث عن موقع...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          // الخريطة
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 14,
              ),
              markers: _selectedMarker != null ? {_selectedMarker!} : {},
              onMapCreated: (controller) => _mapController = controller,
              onTap: (position) {
                setState(() {
                  _currentPosition = position;
                  _selectedMarker = Marker(
                    markerId: const MarkerId("selectedLocation"),
                    position: _currentPosition,
                  );
                  _selectedAddress = "تم تحديد موقع جديد";
                });
              },
            ),
          ),
          // عنوان الموقع وزر الحفظ
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "العنوان: $_selectedAddress",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16.0),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // حفظ الموقع
                    print("تم حفظ الموقع: $_currentPosition");
                  },
                  child: const Text("تأكيد الموقع"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

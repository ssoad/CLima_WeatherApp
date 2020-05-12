import 'package:geolocator/geolocator.dart';

class Location {
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      longitude = position.longitude;
      latitude = position.latitude;
      //print(position);
    } catch (e) {
      print(e);
    }
  }

  double latitude;
  double longitude;
}

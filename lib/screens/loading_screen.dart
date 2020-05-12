import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

var city;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var DecodedData = await weatherModel.GetLocWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: DecodedData,
      );
    }));
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    // getLocation();
    // getLocationData();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 40,
          color: Colors.white,
        ),
      ),
    );
  }
}

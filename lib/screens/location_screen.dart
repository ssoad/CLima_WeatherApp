import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  dynamic locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int condition;
  String CityName;
  String condi_icon;
  String msg;
  @override
  void deactivate() {
    //exit(0);
    // TODO: implement deactivate
    super.deactivate();
  }

  @override
  void initState() {
    // TODO: implement initState
    UpdateUI(widget.locationWeather);
    super.initState();
  }

  void UpdateUI(dynamic weatherData) {
    WeatherModel weatherModel = WeatherModel();
    this.temperature = weatherData['main']['temp'].toInt();
    this.condition = weatherData['weather'][0]['id'];
    this.CityName = weatherData['name'];
    this.condi_icon = weatherModel.getWeatherIcon(condition);
    this.msg = weatherModel.getMessage(temperature);
    print(temperature);
    print(condition);
    print(CityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      WeatherModel weathermodel = WeatherModel();
                      var LocData = await weathermodel.GetLocWeather();
                      UpdateUI(LocData);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print("Return : $typedName");
                      if (typedName != null) {
                        WeatherModel weathermod = WeatherModel();
                        var data = await weathermod.GetCityWeather(typedName);
                        UpdateUI(data);
                        setState(() {});
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$condi_icon️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$msg in $CityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

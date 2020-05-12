import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String CityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    onChanged: (value) {
                      CityName = value;
                      //print(CityName);
                    },
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(
                        color: Colors.black12,
                        fontSize: 18,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      icon: Icon(Icons.location_city),
                    ),
                  )),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, CityName);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

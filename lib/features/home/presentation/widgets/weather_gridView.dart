import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_chars.dart';

class WeatherGridview extends StatelessWidget {
  double minTemp;
  double maxTemp;
  double humidity;
  double windSpeed;
   WeatherGridview({super.key,required this.minTemp,required this.maxTemp,required this.windSpeed,required this.humidity});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      padding: const EdgeInsets.all(10),
      children: [
        WeatherChars(
          iconData: Icons.thermostat,
          number: minTemp,
          UnitOfMeasure: "°C",
          kind: "Min Temp",
        ),
        WeatherChars(
          iconData: Icons.thermostat,
          number: maxTemp,
          UnitOfMeasure: "°C",
          kind: "Max Temp",
        ),
        WeatherChars(
          iconData: Icons.water_drop,
          number: humidity,
          UnitOfMeasure: "%",
          kind: "Humidity",
        ),
        WeatherChars(
          iconData: Icons.wind_power,
          number: windSpeed,
          UnitOfMeasure: "m/s",
          kind: "Wind",
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/entities/weather_model.dart';
// import 'package:weather_app/features/home/data/models/weather_model.dart';
import 'package:weather_app/features/home/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/home/presentation/widgets/app_bar_title.dart';
import 'package:weather_app/features/home/presentation/widgets/calender.dart';
import 'package:weather_app/features/home/presentation/widgets/condation.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_chars.dart';
import 'package:weather_app/features/home/presentation/widgets/weather_gridView.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<WeatherBloc>().add(GetWeatherEvent("Cairo"));
    context.read<WeatherBloc>().add(GetThreeDaysAgoEvent("Cairo"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100), child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.menu, color: Colors.white, size: 30,)
        ],
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppBarTitle(),
        ),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calender(
            onSelectedDate: (date){
              setState(() {
                selectedDate = date;
              });
            },
          ),
          SizedBox(height: 10,),
          Expanded(
            child: BlocBuilder<WeatherBloc, WeatherState>(
  builder: (context, state) {
    if(state is WeatherLoading){
      return Center(child: CircularProgressIndicator(),);
    }

    if (state is WeatherCombinedData) {
      final forecastModel = state.forecastModel;
      final historyList = state.historyList;

      final selectedDateStr =
          "${selectedDate.year.toString().padLeft(4, '0')}-"
          "${selectedDate.month.toString().padLeft(2, '0')}-"
          "${selectedDate.day.toString().padLeft(2, '0')}";

      // نحاول أولاً إيجاد التاريخ داخل الـ history
      ForecastDay? selectedForecast;
      for (final weather in historyList) {
        for (final forecast in weather.forecast) {
          if (forecast.date == selectedDateStr) {
            selectedForecast = forecast;
            break;
          }
        }
        if (selectedForecast != null) break;
      }

      // لو مش لاقي التاريخ، نشوف forecast القادم
      selectedForecast ??= forecastModel.forecast.firstWhere(
            (f) => f.date == selectedDateStr,
        orElse: () => ForecastDay(
          maxwind_kph: 0,
          avghumidity: 0,
          date: selectedDateStr,
          maxTemp: 0,
          minTemp: 0,
          condition: "No data",
          icon: "",
        ),
      );

      // لو مفيش بيانات فعلًا
      if (selectedForecast.condition == "No data") {
        return const Center(child: Text("No data found for selected date."));
      }

      final iconUrl = selectedForecast.icon;
      final fullIconUrl = iconUrl.startsWith("//")
          ? "https:$iconUrl"
          : iconUrl;

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Condation(
              fullIconUrl: fullIconUrl,
              condation: selectedForecast.condition,
            ),
            Expanded(
              child: WeatherGridview(humidity:selectedForecast.avghumidity.toDouble() ,maxTemp:selectedForecast.maxTemp.toDouble() ,minTemp:selectedForecast.minTemp.toDouble() ,windSpeed:selectedForecast.maxwind_kph.toDouble() ,)
            ),
          ],
        ),
      );
    }
    else if (state is WeatherError) {

      return Center(child: Text(state.message));
    } else {
      return const Center(child: Text("Please wait..."));
    }
  },
),
          )
        ],
      ),

    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:weather_app/core/theme/app_pallet.dart';
import 'package:weather_app/core/theme/theme.dart';
import 'package:weather_app/features/home/presentation/widgets/calender.dart';

class HomePage extends StatelessWidget {
  static const String routeName = "HomePage";
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(preferredSize: const Size.fromHeight(100), child: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Icon(Icons.menu,color: Colors.white,size: 30,)

        ],
        backgroundColor: Colors.transparent,
        title: Padding(padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
            Text(
            'Hello',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color:AppPallet.buttonColor,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Eslam Sameh',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Calender(),

        ],
      ),

    );
  }
}

import 'package:flutter/cupertino.dart';

class Condation extends StatelessWidget {
  String fullIconUrl;
  String condation;
   Condation({super.key,required this.fullIconUrl,required this.condation});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color:const Color(0xFF17203A), // Set the background color of the container
        borderRadius: BorderRadius.circular(20.0), // Apply a circular border radius
      ),
      margin: EdgeInsets.all(3),
      child: Row(
        children: [
          Image.network(fullIconUrl,scale: 0.8,),
          Text("$condation Day!",style: TextStyle(fontSize: 25, fontWeight:FontWeight.bold),)
        ],
      ),
    );
  }
}

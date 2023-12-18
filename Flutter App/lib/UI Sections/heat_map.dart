import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
class MyHeatMap extends StatefulWidget {
  final Map<DateTime,int> dataset;
  const MyHeatMap({super.key,
  required this.dataset,});

  @override
  State<MyHeatMap> createState() => _MyHeatMapState();
}

class _MyHeatMapState extends State<MyHeatMap> {
  @override
  Widget build(BuildContext context) {
    return HeatMapCalendar(
      colorMode: ColorMode.opacity,
      showColorTip: false,
      initDate: DateTime.now(),
      colorsets: {
      1:Colors.green,
      2:Colors.redAccent
    },
      size: 50,
      defaultColor: Colors.deepPurple,
      monthFontSize: 30,
      weekFontSize: 15,
      weekTextColor: Colors.white,
      textColor: Colors.white,
      datasets: widget.dataset,
    );
  }
}

import 'package:cal_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    FlutterBodyHralthCalculator(),
  );
}

class FlutterBodyHralthCalculator extends StatefulWidget {
  const FlutterBodyHralthCalculator({super.key});

  @override
  State<FlutterBodyHralthCalculator> createState() =>
      _FlutterBodyHralthCalculatorState();
}

class _FlutterBodyHralthCalculatorState
    extends State<FlutterBodyHralthCalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme), 
      ),
    );
  }
}

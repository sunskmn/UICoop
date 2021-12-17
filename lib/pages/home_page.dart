import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/semicircle.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get color => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('Temperature'),
      )),
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.white.withOpacity(0.9),
                ])),
          ),
          SemiCircleWidget(
              sweepAngle: ((30 - 15) * 12.0).clamp(0.0, 125.0),
              color: Colors.blue),
          Container(
            child: Center(
              child: Text(
                '30°C',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ]),
          ),
        ]),
      ),
    );
  }
}

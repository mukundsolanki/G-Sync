import 'package:flutter/material.dart';
import 'package:gsync/components/joystick_left.dart';
import 'package:gsync/components/joystick_right.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ltValue = 0.0;
  double rtValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: JoystickLeft(),
              ),
              Expanded(
                child: JoystickRight(),
              ),
            ],
          ),
          Positioned(
            left: 16,
            top: 30,
            child: IconButton(
              icon: Icon(Icons.gamepad, size: 32),
              onPressed: () {},
            ),
          ),
          Positioned(
            right: 16,
            top: 30,
            child: IconButton(
              icon: Icon(Icons.gamepad, size: 32),
              onPressed: () {},
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Slider(
                  value: ltValue,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      ltValue = value;
                    });
                    print('LT Value: $value');
                  },
                  onChangeEnd: (value) {
                    print('LT Slider Released');
                    setState(() {
                      ltValue = 0; // Reset the slider value
                    });
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'RT',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Slider(
                  value: rtValue,
                  min: 0,
                  max: 1,
                  onChanged: (value) {
                    setState(() {
                      rtValue = value;
                    });
                    print('RT Value: $value');
                  },
                  onChangeEnd: (value) {
                    print('RT Slider Released');
                    setState(() {
                      rtValue = 0; // Reset the slider value
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

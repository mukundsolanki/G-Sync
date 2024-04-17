import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

const step = 10.0;
const joystickScale = 0.5; // Adjust this value to change the size of the joystick

class JoystickLeft extends StatefulWidget {
  const JoystickLeft({Key? key}) : super(key: key);

  @override
  State<JoystickLeft> createState() => _JoystickLeftState();
}

class _JoystickLeftState extends State<JoystickLeft> {
  double _x = 0;
  double _y = 0;
  JoystickMode _joystickMode = JoystickMode.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(-0.8, 0), // Left alignment
              child: Transform.scale(
                scale: joystickScale,
                child: Joystick(
                  mode: _joystickMode,
                  listener: (details) {
                    setState(() {
                      _x += step * details.x;
                      _y += step * details.y;
                      print('X: $_x, Y: $_y');
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

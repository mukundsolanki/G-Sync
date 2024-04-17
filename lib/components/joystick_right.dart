import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

const step = 10.0;

class JoystickRight extends StatefulWidget {
  const JoystickRight({Key? key}) : super(key: key);

  @override
  State<JoystickRight> createState() => _JoystickRightState();
}

class _JoystickRightState extends State<JoystickRight> {
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
              alignment: const Alignment(0.8, 0), // Right alignment
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
          ],
        ),
      ),
    );
  }
}

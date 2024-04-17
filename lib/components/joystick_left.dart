import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import  'package:gsync/components/direction.dart';

const step = 10.0;
const joystickScale = 0.5;
const directionScale = 0.5;

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
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
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
            Align(
              alignment: Alignment.centerRight,
              child: Transform.scale(
                scale: directionScale,
                child: Direction(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

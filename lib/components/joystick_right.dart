import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gsync/components/xyab_buttons.dart';

const step = 10.0;
const joystickScale = 0.5; 
const topSpacing = 90.0;

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: topSpacing),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ActionButtons(),
              ),
              Align(
                alignment: Alignment.centerRight,
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
      ),
    );
  }
}

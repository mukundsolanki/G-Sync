import 'package:flutter/material.dart';
import 'package:gsync/components/joystick_left.dart';
import 'package:gsync/components/joystick_right.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gsync/components/joystick_left.dart';
import 'package:gsync/components/joystick_right.dart';
import 'package:gsync/components/direction.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: JoystickLeft(),
                ),
                Expanded(
                  child: Direction(),
                ),
              ],
            ),
          ),
          Expanded(
            child: JoystickRight(),
          ),
        ],
      ),
    );
  }
}

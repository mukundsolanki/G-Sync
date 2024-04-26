import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gsync/components/xyab_buttons.dart';
import 'package:web_socket_channel/io.dart';

const step = 10.0;
const joystickScale = 0.5;
const topSpacing = 90.0;

class JoystickRight extends StatefulWidget {
  final IOWebSocketChannel channel;

  const JoystickRight({Key? key, required this.channel}) : super(key: key);

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
                child: ActionButtons(channel: widget.channel),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Transform.scale(
                  scale: joystickScale,
                  child: Joystick(
                    mode: _joystickMode,
                    listener: (details) {
                      setState(() {
                        _x = details.x;
                        _y = details.y;
                        print('X: $_x, Y: $_y');
                        final data = {'joystick': 'right', 'x': _x, 'y': _y};
                        widget.channel.sink.add(jsonEncode(data));
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

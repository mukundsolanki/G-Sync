import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gsync/components/direction.dart';
import 'package:web_socket_channel/io.dart';

const step = 10.0;
const joystickScale = 0.5;
const directionScale = 0.5;

class JoystickLeft extends StatefulWidget {
  final IOWebSocketChannel channel;

  const JoystickLeft({Key? key, required this.channel}) : super(key: key);

  @override
  State<JoystickLeft> createState() => _JoystickLeftState();
}

class _JoystickLeftState extends State<JoystickLeft> {
  double _x = 0;
  double _y = 0;
  JoystickMode _joystickMode = JoystickMode.all;

  final channel = IOWebSocketChannel.connect('ws://192.168.29.192:8080');

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
                      _x = details.x;
                      _y = details.y;
                      print('X: $_x, Y: $_y');
                      final data = {'x': _x, 'y': _y};
                      widget.channel.sink.add(jsonEncode(data));
                    });
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Transform.scale(
                scale: directionScale,
                child: Direction(
                  channel: channel,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

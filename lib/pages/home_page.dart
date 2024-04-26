import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gsync/components/joystick_left.dart';
import 'package:gsync/components/joystick_right.dart';
import 'package:web_socket_channel/io.dart';

class HomePage extends StatefulWidget {
  final IOWebSocketChannel channel;

  const HomePage({Key? key, required this.channel}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double ltValue = 0.0;
  double rtValue = 0.0;

  final channel = IOWebSocketChannel.connect('ws://192.168.29.192:8080');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: JoystickLeft(
                  channel: channel,
                ),
              ),
              Expanded(
                child: JoystickRight(channel: channel,),
              ),
            ],
          ),

          // Rb Button
          Positioned(
            right: 16,
            top: 30,
            child: IconButton(
              icon: Icon(Icons.gamepad, size: 32),
              onPressed: () {
                _handleButtonPress('Rb');
              },
            ),
          ),
          // Lb Button
          Positioned(
            left: 16,
            top: 30,
            child: IconButton(
              icon: Icon(Icons.gamepad, size: 32),
              onPressed: () {
                _handleButtonPress('Lb');
              },
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
                    _sendSliderData('LT', value);
                  },
                  onChangeEnd: (value) {
                    // Reset slider value on release
                    _sendSliderData('LT', 0);
                    setState(() {
                      ltValue =
                          0;
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
                    _sendSliderData('RT', value);
                  },
                  onChangeEnd: (value) {
                    // Reset slider value on release
                    _sendSliderData('RT', 0);
                    setState(() {
                      rtValue =
                          0;
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

  void _handleButtonPress(String buttonName) async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
    widget.channel.sink.add(buttonName);
  }

  void _sendSliderData(String sliderName, double value) {
    widget.channel.sink.add('$sliderName:$value');
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}

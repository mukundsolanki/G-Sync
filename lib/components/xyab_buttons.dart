import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:web_socket_channel/io.dart';

class ActionButtons extends StatelessWidget {
  final double buttonSize;
  final IOWebSocketChannel channel;

  const ActionButtons({Key? key, required this.channel, this.buttonSize = 50}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize * 3,
      height: buttonSize * 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: buttonSize,
            left: 0,
            child: _buildButton('X', Colors.blue),
          ),
          Positioned(
            top: 0,
            left: buttonSize,
            child: _buildButton('Y', Colors.yellow),
          ),
          Positioned(
            top: buttonSize * 2,
            left: buttonSize,
            child: _buildButton('A', Colors.green),
          ),
          Positioned(
            top: buttonSize,
            left: buttonSize * 2,
            child: _buildButton('B', Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, Color color) {
    return ClipOval(
      child: ElevatedButton(
        onPressed: () {
          _handleButtonTap(label);
        },
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(buttonSize, buttonSize),
        ),
      ),
    );
  }

  Future<void> _handleButtonTap(String buttonName) async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
    channel.sink.add(buttonName);
    print('Button $buttonName pressed.');
  }
}

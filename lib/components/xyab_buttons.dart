import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class ActionButtons extends StatelessWidget {
  final double buttonSize;

  const ActionButtons({Key? key, this.buttonSize = 50}) : super(key: key);

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
            child: ClipOval(
              child: ElevatedButton(
                onPressed: () {
                  _handleButtonTap(context, 'X');
                },
                child: Text(
                  'X',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonSize, buttonSize),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: buttonSize,
            child: ClipOval(
              child: ElevatedButton(
                onPressed: () {
                  _handleButtonTap(context, 'Y');
                },
                child: Text(
                  'Y',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonSize, buttonSize),
                ),
              ),
            ),
          ),
          Positioned(
            top: buttonSize * 2,
            left: buttonSize,
            child: ClipOval(
              child: ElevatedButton(
                onPressed: () {
                  _handleButtonTap(context, 'A');
                },
                child: Text(
                  'A',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonSize, buttonSize),
                ),
              ),
            ),
          ),
          Positioned(
            top: buttonSize,
            left: buttonSize * 2,
            child: ClipOval(
              child: ElevatedButton(
                onPressed: () {
                  _handleButtonTap(context, 'B');
                },
                child: Text(
                  'B',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(buttonSize, buttonSize),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleButtonTap(BuildContext context, String buttonName) async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
    // Perform action for the button tap
    print('Button $buttonName tapped.');
  }
}

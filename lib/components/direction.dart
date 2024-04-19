import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

class Direction extends StatelessWidget {
  final double buttonSize;

  const Direction({Key? key, this.buttonSize = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonSize * 3,
      height: buttonSize * 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: buttonSize,
            child: IconButton(
              icon: Icon(Icons.arrow_upward),
              iconSize: buttonSize,
              onPressed: () {
                _handleHapticFeedback();
              },
            ),
          ),
          Positioned(
            top: buttonSize * 2,
            left: buttonSize,
            child: IconButton(
              icon: Icon(Icons.arrow_downward),
              iconSize: buttonSize,
              onPressed: () {
                _handleHapticFeedback();
              },
            ),
          ),
          Positioned(
            top: buttonSize,
            left: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: buttonSize,
              onPressed: () {
                _handleHapticFeedback();
              },
            ),
          ),
          Positioned(
            top: buttonSize,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: buttonSize,
              onPressed: () {
                _handleHapticFeedback();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _handleHapticFeedback() async {
    if (await Vibrate.canVibrate) {
      Vibrate.feedback(FeedbackType.success);
    }
  }
}

import 'package:flutter/material.dart';

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
            child: ElevatedButton(
              onPressed: () {
                // Action when X button is pressed
              },
              child: Text('X'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonSize, buttonSize),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: buttonSize,
            child: ElevatedButton(
              onPressed: () {
                // Action when Y button is pressed
              },
              child: Text('Y'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonSize, buttonSize),
              ),
            ),
          ),
          Positioned(
            top: buttonSize * 2,
            left: buttonSize,
            child: ElevatedButton(
              onPressed: () {
                // Action when A button is pressed
              },
              child: Text('A'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonSize, buttonSize),
              ),
            ),
          ),
          Positioned(
            top: buttonSize,
            left: buttonSize * 2,
            child: ElevatedButton(
              onPressed: () {
                // Action when B button is pressed
              },
              child: Text('B'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(buttonSize, buttonSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

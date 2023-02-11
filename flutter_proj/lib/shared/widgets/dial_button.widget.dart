import 'package:flutter/material.dart';

class DialButtonWidget extends StatelessWidget {
  final String text;
  final Function(String) onPress;

  const DialButtonWidget({
    required Key key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 20,
        height: MediaQuery.of(context).size.width / 4 - (1.5 * 4) - 20,
        margin: const EdgeInsets.all(3),
        child: ElevatedButton(
          onPressed: () => onPress(text),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.black,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      );
}
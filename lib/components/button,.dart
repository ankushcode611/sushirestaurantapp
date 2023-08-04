import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  const MyButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 143, 73, 68),
          border: Border.all(
            color: Colors.white, // Outline color
            width: 0.7, // Outline width
          ),
          borderRadius: BorderRadius.circular(40)),
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //text
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),

          //space
          const SizedBox(width: 10),

          //icon
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

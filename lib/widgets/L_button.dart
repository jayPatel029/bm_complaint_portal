import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String Bname;
  final VoidCallback onTap;
  final double height;
  final double width;

  CustomButton(
      {super.key,
        required this.Bname,
        required this.onTap,
        required this.height,
        required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    Bname,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ))),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class CustomTextfield extends StatelessWidget {
//   final String hint;
//   final TextEditingController controller;
//
//   const CustomTextfield({
//     Key? key,
//     required this.hint,
//     required this.controller,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
//           border: Border.all(
//             color: Colors.grey, // You can customize border color
//             width: 1, // You can customize border width
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: TextFormField(
//             autovalidateMode: AutovalidateMode.always,
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               border: InputBorder.none, // Hide the default border
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final double width;
  final double height;
  final Color shadowColor;

  const CustomTextfield({
    Key? key,
    required this.hint,
    required this.controller,
    this.width = double.infinity, // Default width is set to fill available space
    this.height = 50, // Default height is set to 50
    this.shadowColor = Colors.grey, // Default shadow color is grey
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 5,
              offset: Offset(0, 3), // Vertical shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none, // Hide the default border
            ),
          ),
        ),
      ),
    );
  }
}

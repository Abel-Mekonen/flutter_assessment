import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const AppTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 40, 39, 39), // Background color of the search bar
        borderRadius: BorderRadius.circular(25.0), // Rounded corners
      ),
      child:  TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white54), // Placeholder text color
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        ),
      ),
    );
  }
}

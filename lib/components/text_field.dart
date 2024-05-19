// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.label,
    this.keyType = TextInputType.text,
    required this.controller,
    required this.icon,
    required this.validator,
    this.obscureText,
  });
  final String label;
  final TextInputType keyType;
  final TextEditingController controller;
  bool? obscureText ;
  IconData? icon;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      enableSuggestions: true,
      validator: widget.validator,
      controller: widget.controller,
      cursorColor: Colors.amber,
      obscureText: widget.obscureText??false,
      keyboardType: widget.keyType,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.orange),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 120, 66, 3),
        hintText: widget.label,
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            color: Colors.black,
            icon: Icon(widget.icon),
            onPressed: () {
              setState(() {
                if (widget.icon == CupertinoIcons.eye_slash_fill) {
                  widget.obscureText = !widget.obscureText!;
                  widget.icon = CupertinoIcons.eye_fill;
                } else if (widget.icon == CupertinoIcons.eye_fill) {
                  widget.obscureText = !widget.obscureText!;
                  widget.icon = CupertinoIcons.eye_slash_fill;
                }
              });
            },
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70,
      backgroundColor: const Color.fromARGB(115, 29, 28, 28),
      child: Image.asset(
        'assets/logo.png',
        fit: BoxFit.fitWidth,
        height: 150,
        width: 150,
      ),
    );
  }
}

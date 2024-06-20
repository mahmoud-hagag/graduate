import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';

// ignore: must_be_immutable
class CustomCardProgram extends StatefulWidget {
  CustomCardProgram(
      {super.key,
      required this.counter,
      required this.name,
      required this.unit});

  String name;
  int counter;
  String unit;
  @override
  State<CustomCardProgram> createState() => _CustomCardProgramState();
}

class _CustomCardProgramState extends State<CustomCardProgram> {
  int _incrementCounter(int counter) {
    ++counter;
    return counter;
  }

  int _decrementCounter(int counter) {
    if (counter > 0) {
      --counter;
    }
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    widget.name,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.counter = _incrementCounter(widget.counter);
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_up_rounded),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      widget.counter.toString(),
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: baseColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  widget.unit,
                  style: const TextStyle(
                    fontSize: 18,
                    color: baseColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.counter = _decrementCounter(widget.counter);
                    });
                  },
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

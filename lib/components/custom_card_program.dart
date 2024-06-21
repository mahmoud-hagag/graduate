import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';
import 'package:graduate/screens/doctors/programs/create_program.dart';

// ignore: must_be_immutable
class CustomCardProgram extends StatefulWidget {
  CustomCardProgram(
      {super.key,
      this.countUnit=1,
      required this.counter,
      required this.name,
      required this.unit});

  String name;
  int counter;
  int countUnit;
  String unit;
  @override
  State<CustomCardProgram> createState() => _CustomCardProgramState();
}

class _CustomCardProgramState extends State<CustomCardProgram> {
  int _incrementCounter(int counter,int countUnit) {
    counter+=countUnit;
    return counter;
  }

  int _decrementCounter(int counter,int countUnit) {
    if (counter > 0) {
      counter-=countUnit;
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
                      if(widget.name=='Reps')
                      {
                        counterReps = _incrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _incrementCounter(widget.counter,widget.countUnit);
                      }
                      else if(widget.name=='Sets'){
                        counterSets = _incrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _incrementCounter(widget.counter,widget.countUnit);
                      }
                      else if(widget.name=='Rest Time'){
                        counterRest = _incrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _incrementCounter(widget.counter,widget.countUnit);
                      }
                      else{
                        counterW = _incrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _incrementCounter(widget.counter,widget.countUnit);
                      }
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
                      if(widget.name=='Reps')
                      {
                        counterReps = _decrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _decrementCounter(widget.counter,widget.countUnit);
                      }
                      else if(widget.name=='Sets'){
                        counterSets = _decrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _decrementCounter(widget.counter,widget.countUnit);
                      }
                      else if(widget.name=='Rest Time'){
                        counterRest = _decrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _decrementCounter(widget.counter,widget.countUnit);
                      }
                      else{
                        counterW = _decrementCounter(widget.counter,widget.countUnit);
                        widget.counter = _decrementCounter(widget.counter,widget.countUnit);
                      }
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

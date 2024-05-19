import 'package:flutter/material.dart';
import 'package:graduate/constants/colors.dart';

class PageViewCustom extends StatefulWidget {
  const PageViewCustom({super.key});

  @override
  State<PageViewCustom> createState() => _PageViewCustomState();
}

class _PageViewCustomState extends State<PageViewCustom> {
  final _pageController = PageController(
    initialPage: 0,
    viewportFraction: .9,
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      scrollDirection: Axis.horizontal, // or Axis.vertical
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: const Color(0xff6D92F4),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(child: Text('hello\nand welcome back to SO3OD',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
        ),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(child: Text('News\nWhats the news',style: TextStyle(fontSize: 22,fontStyle: FontStyle.italic),)),
        ),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 12, 225, 101),
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(child: Text('*************')),
        ),
      ],
    );
  }
}

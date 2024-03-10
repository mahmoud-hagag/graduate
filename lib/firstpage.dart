import 'package:flutter/material.dart';
import 'package:graduate/components/logo.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 81, 77, 77),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(width: double.infinity, child: Logo()),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text(
              "Choose Your Class",
              style: TextStyle(
                fontSize: 32,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/logintrainee');
            },
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'assets/scholar.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: Text(
                    "Trainee",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/logindoctor');
            },
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: Image.asset(
                    'assets/doctor.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Doctor",
                    style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

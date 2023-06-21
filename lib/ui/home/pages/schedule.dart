import 'dart:math';

import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1.1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: List.generate(
                  20,
                  (index) => ProgramTile(
                    time: _generateRandomTime(),
                    program: 'Program ${index + 1}',
                    venue: 'Venue ${index + 1}',
                    color: _generateRandomColor(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  String _generateRandomTime() {
    final Random random = Random();
    final hour = random.nextInt(24);
    final minute = random.nextInt(60);
    return '$hour:${minute.toString().padLeft(2, '0')}';
  }
}

class ProgramTile extends StatelessWidget {
  final String time;
  final String program;
  final String venue;
  final Color color;

  const ProgramTile({
    required this.time,
    required this.program,
    required this.venue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            program,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: const Color.fromARGB(255, 35, 35, 35),
            ),
          ),
          SizedBox(height: 5),
          Text(
            venue,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

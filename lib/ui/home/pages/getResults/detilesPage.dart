import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../back_end/firebase/schedule_datas.dart';

class ProgramDetailsScreen extends StatelessWidget {
  final Program program;

  const ProgramDetailsScreen({super.key, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 208, 212, 214),
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  '${program.category}  ${program.program}  ',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ))),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: program.students.length,
              itemBuilder: (context, index) {
                Map<String, String> student = program.students[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Container(
                    height: 150,
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: _generateRandomColor(),
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            '${index + 1}',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: ListTile(
                              title: Text(
                                ' ${student['name']}',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  Text(
                                    'Roll No: ${student['roll no']}',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Point: ${student['point']}',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Team: ${student['team']}',
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(
                'Congragulations',
                style: GoogleFonts.aBeeZee(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: _generateRandomColorforc()),
              ),
            ),
          ],
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
    ).withOpacity(0.3);
  }

  Color _generateRandomColorforc() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    ).withRed(2);
  }
}

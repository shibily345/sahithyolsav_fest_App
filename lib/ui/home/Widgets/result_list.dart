// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

@immutable
class ResultBox extends StatelessWidget {
  int result;
  String first;
  String second;
  String third;
  String cate;
  String program;
  ResultBox({
    Key? key,
    required this.result,
    required this.first,
    required this.second,
    required this.third,
    required this.cate,
    required this.program,
  }) : super(key: key);
  Color? colorg1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 179, 249, 176),
                    Color.fromARGB(255, 126, 199, 226),
                  ],
                ),
                color: const Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "RESULT : $result",
                style: GoogleFonts.righteous(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.5)),
              ),
            ),
          ),
          Positioned(
            bottom: 7,
            left: 20,
            child: autsctext(text: '$cate $program'),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: SvgPicture.asset(
              "assets/first11.svg",
              width: 140,
              height: 140,
            ),
          ),
          Positioned(
            top: 20,
            left: 70,
            child: Text(
              first,
              style: GoogleFonts.fraunces(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 64, 0)),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              second,
              style: GoogleFonts.adamina(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 115, 114, 114)),
            ),
          ),
          Positioned(
            top: 85,
            left: 125,
            child: Text(
              third,
              style: GoogleFonts.adamina(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 103, 39, 39)),
            ),
          ),
        ],
      ),
    );
  }
}

class autsctext extends StatelessWidget {
  final String text;
  const autsctext({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 190,
      child: Marquee(
        text: text,
        style: const TextStyle(fontSize: 16.0),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 70.0,
        pauseAfterRound: const Duration(seconds: 2),
        startPadding: 10.0,
        accelerationDuration: const Duration(seconds: 2),
        accelerationCurve: Curves.linear,
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}

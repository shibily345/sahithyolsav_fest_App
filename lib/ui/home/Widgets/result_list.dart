// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

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
            bottom: 10,
            left: 20,
            child: Row(
              children: [
                Text(
                  cate,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75)),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  program,
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 19, 19, 19)),
                ),
              ],
            ),
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
                  fontSize: 25,
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
                  fontSize: 25,
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
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 103, 39, 39)),
            ),
          ),
        ],
      ),
    );
  }
}

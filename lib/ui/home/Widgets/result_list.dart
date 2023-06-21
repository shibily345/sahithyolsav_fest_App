import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ResultList extends StatelessWidget {
  ResultList({super.key, required this.widget});
  String widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 179, 249, 176),
                    Color.fromARGB(255, 126, 199, 226),
                  ],
                ),
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: 100,
            child: Center(
              child: Text(
                "RESULT : 125",
                style: GoogleFonts.righteous(
                    fontSize: 65,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 20,
            child: Row(
              children: [
                Text(
                  "Senior",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75)),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Elocation English ",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 19, 19, 19)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/first11.svg",
                  width: 40,
                  height: 40,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  "CHEST NO : 455 ",
                  style: GoogleFonts.concertOne(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 0, 0)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  ResultBox({super.key, this.colorg1});
  Color? colorg1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 179, 249, 176),
                    Color.fromARGB(255, 126, 199, 226),
                  ],
                ),
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: 200,
            width: 200,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "RESULT : 125",
                style: GoogleFonts.righteous(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.withOpacity(0.2)),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            child: Row(
              children: [
                Text(
                  "Senior",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 75, 75, 75)),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Elocation English ",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 19, 19, 19)),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
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
              "185 ",
              style: GoogleFonts.fraunces(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 64, 0)),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Text(
              "235 ",
              style: GoogleFonts.adamina(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 115, 114, 114)),
            ),
          ),
          Positioned(
            top: 85,
            left: 115,
            child: Text(
              "345 ",
              style: GoogleFonts.adamina(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 103, 39, 39)),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamPointList extends StatelessWidget {
  TeamPointList({super.key, required this.widget});
  String widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 179, 249, 176),
                    Color.fromARGB(255, 243, 183, 183),
                  ],
                ),
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "1 ",
                  style: GoogleFonts.bungeeShade(
                      fontSize: 65,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 103, 39, 39)),
                ),
                Text(
                  "Vattamkulam ",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 103, 39, 39)),
                ),
                Text(
                  "323 ",
                  style: GoogleFonts.montserrat(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 103, 39, 39)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

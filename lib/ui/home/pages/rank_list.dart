import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sahithyolsav_app/ui/home/Widgets/result_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RanklistPage extends StatefulWidget {
  const RanklistPage({super.key});

  @override
  State<RanklistPage> createState() => _RanklistPageState();
}

class _RanklistPageState extends State<RanklistPage> {
  int activeIndex = 0;
  final posters = [
    'https://i.ytimg.com/vi/CpSxAV4nyCk/maxresdefault.jpg',
    'https://i.pinimg.com/736x/43/bf/4c/43bf4c0b3e812ca19e035c2563bbe464.jpg',
    'https://i.pinimg.com/736x/19/21/2f/19212fec58587ff6c74b88d5a7767643.jpg',
    'https://i.pinimg.com/736x/43/bf/4c/43bf4c0b3e812ca19e035c2563bbe464.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.white,
          pinned: true,
          expandedHeight: 450.0,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.green,
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 218, 227, 231),
                  Color.fromARGB(255, 126, 199, 226),
                ],
              ),
            ),
            height: 500,
            width: Get.width,
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/firstRK.svg",
                  width: Get.width,
                  height: 560,
                ),
                Positioned(
                  left: 170,
                  bottom: 235,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Vattamkulam",
                      style: GoogleFonts.oleoScript(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 145, 0)),
                    ),
                  ),
                ),
                Positioned(
                  right: 70,
                  bottom: 195,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "Manoor",
                      style: GoogleFonts.oleoScript(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 137, 80, 80)),
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  bottom: 210,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      "East Manoor",
                      style: GoogleFonts.oleoScript(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 77, 77, 77)),
                    ),
                  ),
                )
              ],
            ),
          )
              //title: Text('Demo'),
              ),
        ),
        SliverFixedExtentList(
          itemExtent: 130.0,
          delegate: SliverChildBuilderDelegate(
            childCount: 20,
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                //color: Colors.lightBlue[100 * (index % 9)],
                child: TeamPointList(widget: ""),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
      effect: ExpandingDotsEffect(
          dotWidth: 10, dotHeight: 10, activeDotColor: Colors.green),
      activeIndex: activeIndex,
      count: posters.length);
}

Widget buildimage(String image, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Image.network(image, fit: BoxFit.cover));

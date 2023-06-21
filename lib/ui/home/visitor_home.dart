import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Widgets/result_list.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            background: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, right: 20),
                  child: Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Iconsax.setting))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.5), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2),
                          ),
                        ],
                        color: Color.fromARGB(255, 239, 239, 239),
                        borderRadius: BorderRadius.circular(20)),
                    height: 300,
                    width: Get.width,
                    child: CarouselSlider.builder(
                        itemCount: posters.length,
                        itemBuilder: (context, index, realindex) {
                          final images = posters[index];
                          return buildimage(images, index);
                        },
                        options: CarouselOptions(
                          height: 400,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index),
                        )),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                buildIndicator(),
              ],
            ),
            //title: Text('Demo'),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.0,
            mainAxisExtent: 250,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                //color: Colors.teal[100 * (index % 9)],
                child: ResultBox(
                  colorg1: Colors.teal[100 * (index % 9)],
                ),
              );
            },
            childCount: 20,
          ),
        ),
        // SliverFixedExtentList(
        //   itemExtent: 130.0,
        //   delegate: SliverChildBuilderDelegate(
        //     childCount: 20,
        //     (BuildContext context, int index) {
        //       return Container(
        //         alignment: Alignment.center,
        //         //color: Colors.lightBlue[100 * (index % 9)],
        //         child: ResultList(widget: ""),
        //       );
        //     },
        //   ),
        // ),
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

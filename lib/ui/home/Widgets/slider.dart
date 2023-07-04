import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/back_end/firebase/get_data.dart';

import '../controller.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final FirebaseController controller = Get.put(FirebaseController());
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: controller.fetchFirestoreData(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('An error occurred'));
        }

        List<String> dataList = snapshot.data ?? [];

        return dataList.isEmpty
                ? const Center(
                    child: Text('Coming Soon...'),
                  )
                : CarouselSlider.builder(
          itemCount: dataList.length,
          itemBuilder: (context, index, realindex) {
            final images = dataList[index];
            return buildimage(images, index);
          },
          options: CarouselOptions(
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            height: 400,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                // Update your activeIndex or other necessary variables here
                controller.activeIndex = index;
              });
            },
          ),
        );
      },
    );
  }

  Widget buildimage(String image, int index) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(image, fit: BoxFit.cover));
}

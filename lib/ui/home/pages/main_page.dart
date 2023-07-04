import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sahithyolsav_app/ui/home/Widgets/slider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../back_end/firebase/get_data.dart';
import '../../../back_end/firebase/schedule_datas.dart';
import '../Widgets/drawer_widget.dart';
import '../Widgets/result_list.dart';
import '../controller.dart';
import 'getResults/detilesPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PanelController _panelController = PanelController();

  final FirebaseController fcontroller = Get.put(FirebaseController());
  final HomeController homeController = Get.put(HomeController());
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: SlidingUpPanel(
        parallaxEnabled: true,
        parallaxOffset: .5,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        controller: _panelController,
        minHeight: MediaQuery.of(context).size.height * 0.4,
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        panelBuilder: (controller) => panelWidget(
          controller: controller,
          panalController: _panelController,
        ),
        // panel: _buildPanel(),
        // collapsed: _buildCollapsedPanel(),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
            ),
            _buildGridView(),
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
    );
  }

  Widget _buildGridView() {
    return SizedBox(
      height: Get.height * 0.48,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), //color of shadow
                    spreadRadius: 5, //spread radius
                    blurRadius: 7, // blur radius
                    offset: const Offset(0, 2),
                  ),
                ],
                color: const Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.circular(20)),
            height: 300,
            width: Get.width,
            child: const SliderWidget()),
      ),
    );
  }

  Widget _buildPanel() {
    return Container(
      color: Colors.red,
      child: const Center(
        child: Text(
          'Panel',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget buildDragHandle() {
    return GestureDetector(
      // onTap: togglePanel,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            width: 50,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget panelWidget(
      {required ScrollController controller,
      required PanelController panalController}) {
    return LiquidPullToRefresh(
      color: Colors.transparent,
      backgroundColor: _generateRandomColor(),
      key: _refreshIndicatorKey,
      onRefresh: _refreshData,
      child: FutureBuilder<List<Program>>(
          future: fcontroller.fetchPrograms(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text('Error fetching data'));
            }
            List<Program>? programs = snapshot.data;
            List<Program> reversedPrograms = programs?.reversed.toList() ?? [];
            List<int> reversedIndices =
                List.generate(reversedPrograms.length, (index) => index);

            return Column(
              children: [
                buildDragHandle(),
                Expanded(
                  child: programs!.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text('Results Coming Soon...'),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: programs.length,
                          itemBuilder: (context, index) {
                            Program program = reversedPrograms[index];
                            int reversedIndex =
                                reversedPrograms.length - 1 - index;
                            String rollNo = program.students
                                .map((student) => student['roll'])
                                .join(', ');
                            List<String?> rollNumbers = program.students
                                .map((student) => student['roll no'])
                                .toList();

                            String? rollNo1 =
                                rollNumbers.isNotEmpty ? rollNumbers[0] : '';
                            String? rollNo2 =
                                rollNumbers.length > 1 ? rollNumbers[1] : '';
                            String? rollNo3 =
                                rollNumbers.length > 2 ? rollNumbers[2] : '';

                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProgramDetailsScreen(program: program),
                                  ),
                                );
                              },
                              child: ResultBox(
                                  result: reversedIndex + 1,
                                  first: rollNo1!,
                                  second: rollNo2!,
                                  third: rollNo3!,
                                  cate: program.category,
                                  program: program.program),
                            );
                          },
                        ),
                ),
              ],
            );
          }),
    );
  }
}

Widget buildimage(String image, int index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Image.network(image, fit: BoxFit.cover));

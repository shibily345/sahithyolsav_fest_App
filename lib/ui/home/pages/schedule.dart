import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../../back_end/firebase/get_data.dart';
import '../../../back_end/firebase/schedule_datas.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final FirebaseController controller = Get.put(FirebaseController());

  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();

  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      color: _generateRandomColor(),
      backgroundColor: _generateRandomColor(),
      key: _refreshIndicatorKey,
      onRefresh: _refreshData,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<Event>>(
            future: controller.fetchFirestorescheData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return const Center(child: Text('Error occurred'));
              }

              List<Event> eventList = snapshot.data ?? [];

              return eventList.isEmpty
                  ? const Center(
                      child: Text('Coming Soon...'),
                    )
                  : GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            2, // Adjust the number of columns as per your preference
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: eventList.length,
                      itemBuilder: (context, index) {
                        return ProgramTile(
                            time: ' ${eventList[index].time}',
                            program: ' ${eventList[index].program}',
                            venue: ' ${eventList[index].venue}',
                            color: _generateRandomColor());
                      },
                    );
            },
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
}

class ProgramTile extends StatelessWidget {
  final String time;
  final String program;
  final String venue;
  final Color color;

  const ProgramTile({
    super.key,
    required this.time,
    required this.program,
    required this.venue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Text(program,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          const SizedBox(height: 10),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            time,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18,
              color: Color.fromARGB(255, 35, 35, 35),
            ),
          ),
          const SizedBox(height: 5),
          Text(venue,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

import 'dart:async';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RanklistPage extends StatefulWidget {
  const RanklistPage({super.key});

  @override
  State<RanklistPage> createState() => _RanklistPageState();
}

class _RanklistPageState extends State<RanklistPage> {
  Timer? _timer;

  String? firstTeamName;
  String? secondTeamName;
  String? thirdTeamName;
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  Future<void> _refreshData() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const duration = Duration(seconds: 1);
    _timer = Timer(duration, () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  final PanelController _panelController = PanelController();
  final bool _isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: _buildGridView(),
      ),
    );
  }

  Widget _buildGridView() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
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
            left: Get.width * 0.40,
            bottom: Get.height * 0.62,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                overflow: TextOverflow.ellipsis,
                firstTeamName ?? 'Loading...',
                style: GoogleFonts.oleoScript(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 255, 145, 0)),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.70,
            bottom: Get.height * 0.58,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                overflow: TextOverflow.ellipsis,
                thirdTeamName ?? '',
                style: GoogleFonts.oleoScript(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 137, 80, 80)),
              ),
            ),
          ),
          Positioned(
            left: Get.width * 0.15,
            bottom: Get.height * 0.6,
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                overflow: TextOverflow.ellipsis,
                secondTeamName ?? '',
                style: GoogleFonts.oleoScript(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 77, 77, 77)),
              ),
            ),
          ),
        ],
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

  Widget buildDragHandle() {
    return GestureDetector(
      // onTap: togglePanel,
      child: Center(
        child: Container(
          width: 50,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(12),
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
        child: buildStreamBuilder());
  }

  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> buildStreamBuilder() {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('teams')
          .doc('overall_points')
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }
        final data = snapshot.data!.data();
        final results = data!['results'] as String;
        final teams = List<Map<String, dynamic>>.from(data['teams']);

        return teams.isEmpty
            ? const Center(
                child: Text('Coming Soon...'),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'After $results Results', // Display the ranking number
                    style: GoogleFonts.yatraOne(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: teams.length,
                      itemBuilder: (context, index) {
                        final team = teams[index];
                        final teamName = team['teamName'] as String;
                        final points = team['points'] as int;
                        final ranking = index + 1;
                        if (teams.isNotEmpty) {
                          firstTeamName = teams[0]['teamName'] as String?;
                        }
                        if (teams.length >= 2) {
                          secondTeamName = teams[1]['teamName'] as String?;
                        }
                        if (teams.length >= 3) {
                          thirdTeamName = teams[2]['teamName'] as String?;
                        }
                        return ListTile(
                          leading: Text(
                            '$ranking', // Display the ranking number
                            style: GoogleFonts.yatraOne(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          title:
                              Text(overflow: TextOverflow.ellipsis, teamName),
                          trailing:
                              Text(overflow: TextOverflow.ellipsis, ' $points'),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}

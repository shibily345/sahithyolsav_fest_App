// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:sahithyolsav_app/ui/home/pages/profile.dart';
import 'package:sahithyolsav_app/ui/home/pages/rank_list.dart';
import 'package:sahithyolsav_app/ui/home/pages/schedule.dart';
import 'package:sahithyolsav_app/ui/home/visitor_home.dart';

import '../../../back_end/spreadsheet/user.dart';

class NavigationPage extends StatefulWidget {
  final User? user;
  const NavigationPage({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  get user => widget.user;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    MainPage(),
    SchedulePage(),
    RanklistPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              notchColor: Colors.black87,
              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                ///svg example
                BottomBarItem(
                  inActiveItem: Icon(Iconsax.home_hashtag),
                  activeItem: Icon(
                    Iconsax.home,
                    color: Colors.green,
                  ),
                  itemLabel: 'Home',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.calendar_1,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Iconsax.calendar_2,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Schedule',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.ranking_1,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Iconsax.ranking_1,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Rank',
                ),
                const BottomBarItem(
                  inActiveItem: Icon(
                    Iconsax.profile_2user,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Iconsax.profile_2user,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Profile',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
            )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}

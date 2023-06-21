import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sahithyolsav_app/back_end/spreadsheet/user_sheets_api.dart';

import '../../../back_end/spreadsheet/user.dart';

class ProfilePage extends StatefulWidget {
  final User? user;

  const ProfilePage({super.key, this.user});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    initUser();
  }

  @override
  void didUpdateWidget(covariant ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    initUser();
  }

  void initUser() {
    final name = widget.user == null ? '' : widget.user!.name;
    final id = widget.user == null ? '' : widget.user!.id;
    final Category = widget.user == null ? '' : widget.user!.category;
    final unit = widget.user == null ? '' : widget.user!.unit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    InfoTile(
                      title: 'Name',
                      subtitle: widget.user == null ? '' : widget.user!.name,
                      icon: Iconsax.user,
                      color: Colors.blue,
                    ),
                    InfoTile(
                      title: 'Chest No',
                      subtitle: widget.user == null ? '' : widget.user!.id,
                      icon: Iconsax.note_1,
                      color: Colors.green,
                    ),
                    InfoTile(
                      title: 'Unit',
                      subtitle: widget.user == null ? '' : widget.user!.unit,
                      icon: Icons.location_on,
                      color: Colors.orange,
                    ),
                    InfoTile(
                      title: 'catogory',
                      subtitle:
                          widget.user == null ? '' : widget.user!.category,
                      icon: Icons.category_outlined,
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const InfoTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

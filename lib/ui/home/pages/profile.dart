import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? fid;
  final spreadsheetId = '1nGYZ5VojmxhFSPaLMkKb69Y30UUymlevXFzmETagqcI';
  dynamic rowData;
  @override
  void initState() async {
    super.initState();
  }

  Future<void> fetchData() async {
    try {
      final url =
          'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/sahithyolsav';
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);

      // final idToFetch = 'YOUR_ID_TO_FETCH';
      for (final row in data['values']) {
        if (row[1] == fid) {
          setState(() {
            rowData = row;
          });
          break;
        }
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle error and display an error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: rowData != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: SingleChildScrollView(
                        child: GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            InfoTile(
                              title: ' ${rowData[1]}',
                              subtitle: ' ${rowData[2]}',
                              icon: Iconsax.user,
                              color: Colors.blue,
                            ),
                            InfoTile(
                              title: 'Chest No',
                              subtitle: ' ${rowData[1]}',
                              icon: Iconsax.note_1,
                              color: Colors.green,
                            ),
                            InfoTile(
                              title: 'Unit',
                              subtitle: ' ${rowData[4]}',
                              icon: Icons.location_on,
                              color: Colors.orange,
                            ),
                            InfoTile(
                              title: 'catogory',
                              subtitle: ' ${rowData[3]}',
                              icon: Icons.category_outlined,
                              color: Colors.purple,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator())),
    );
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedId = sharedPreferences.getString('id');
    print(obtainedId);
    setState(() {
      fid = obtainedId;
    });
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const InfoTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
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
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

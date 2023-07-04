import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sahithyolsav_app/back_end/firebase/schedule_datas.dart';

class FirebaseController extends GetxController {
  FirebaseController();
  List<String> banners = [];
  int activeIndex = 0;
  Future getBanners() async {
    FirebaseFirestore.instance
        .collection('banners')
        .orderBy('timestamp', descending: true)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((element) {
            banners.add(element.reference.id);
          }),
        );
  }

  Future<List<String>> fetchFirestoreData() async {
    List<String> dataList = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('banners').get();

    for (var doc in querySnapshot.docs) {
      String data = doc.get('image') ?? '';

      // Assuming you have a 'timestamp' field in your documents
      // Timestamp timestamp = doc.get('timestamp');

      dataList.add(data);
    }

    // Sort the dataList based on the timestamp in ascending order

    return dataList;
  }

  Future<List<Event>> fetchFirestorescheData() async {
    List<Event> eventList = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('schedules').get();

    for (var doc in querySnapshot.docs) {
      String program = doc.get('eventName') ?? '';
      String time = doc.get('time') ?? '';
      String venue = doc.get('venue') ?? '';
      // Assuming you have a 'timestamp' field in your documents
      Timestamp timestamp = doc.get('timestamp');

      Event event = Event(
          time: time, program: program, venue: venue, timestamp: timestamp);
      eventList.add(event);
    }

    // Sort the eventList based on the timestamp in descending order
    eventList.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return eventList;
  }

  Future<List<MapData>> fetchAndSortFirestoreData() async {
    List<MapData> dataList = [];

    // Replace 'collectionName' with the actual name of your collection
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('teams').get();

    for (var doc in querySnapshot.docs) {
      // Replace 'numberField' and 'stringField' with the actual field names in your documents
      int number = doc.get('points') ?? 0;
      String stringValue = doc.get('teamName') ?? '';

      MapData mapData = MapData(number: number, stringValue: stringValue);
      dataList.add(mapData);
    }

    // Sort the dataList in decreasing order based on the 'number' field
    //  dataList.sort((a, b) => b.number.compareTo(a.number));

    return dataList;
  }

  Future<List<Program>> fetchPrograms() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('results').get();

    List<Program> programs = [];
    for (var doc in snapshot.docs) {
      List<Map<String, String>> students = [];
      List<dynamic> rawStudents = doc['results'];

      for (var rawStudent in rawStudents) {
        students.add({
          'name': rawStudent['name'],
          'roll no': rawStudent['roll'],
          'point': rawStudent['point'],
          'team': rawStudent['team'],
        });
      }

      Program program = Program(
        category: doc['category'],
        program: doc['programName'],
        students: students,
      );

      programs.add(program);
    }

    return programs;
  } // Assuming you have a reference to your Firebase collection
}

class Event {
  final String time;
  final String program;
  final String venue;

  Event({required this.time, required this.program, required this.venue});
}

class MapData {
  final int number;
  final String stringValue;

  MapData({required this.number, required this.stringValue});
}

class DataModel {
  String category;
  String program;
  List<Map<String, String>> dataList;

  DataModel(
      {required this.category, required this.program, required this.dataList});
}

class Program {
  String category;
  String program;
  List<Map<String, String>> students;

  Program(
      {required this.category, required this.program, required this.students});
}

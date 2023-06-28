// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserFields {
  static const String idn = 'idn';
  static const String id = 'id';
  static const String name = 'name';
  static const String category = 'category';
  static const String unit = 'unit';
  static List<String> getFields() => [idn, id, name, category, unit];
}

class User {
  final int? idn;
  final String id;
  final String name;
  final String category;
  final String unit;
  User({
    this.idn,
    required this.id,
    required this.name,
    required this.category,
    required this.unit,
  });
  User copy({
    int? idn,
    String? id,
    String? name,
    String? category,
    String? unit,
  }) =>
      User(
        idn: idn ?? this.idn,
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        unit: unit ?? this.unit,
      );
  static User fromJson(Map<String, dynamic> json) => User(
        idn: jsonDecode(json[UserFields.idn]),
        id: json[UserFields.id],
        name: json[UserFields.name],
        category: json[UserFields.category],
        unit: json[UserFields.unit],
      );
  Map<String, dynamic> toJson() => {
        UserFields.idn: idn,
        UserFields.id: id,
        UserFields.name: name,
        UserFields.category: category,
        UserFields.unit: unit,
      };
}

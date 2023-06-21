// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserFields {
  static final String idn = 'idn';
  static final String id = 'id';
  static final String name = 'name';
  static final String category = 'category';
  static final String unit = 'unit';
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

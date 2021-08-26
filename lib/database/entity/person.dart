import 'package:floor/floor.dart';

@Entity(tableName: 'people')
class Person {
  @PrimaryKey()
  final String id;
  final String name;

  Person(this.id, this.name);

  Person copyWith({
    String? id,
    String? name,
  }) =>
      Person(
        id ?? this.id,
        name ?? this.name,
      );
}

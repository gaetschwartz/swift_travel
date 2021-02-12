import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
abstract class Union with _$Union {
  const factory Union(String name) = Person;
  const factory Union.animal(String name, int legs) = Animal;
  const factory Union.number(int number) = Number;

  factory Union.fromJson(Map<String, dynamic> json) => _$UnionFromJson(json);
}

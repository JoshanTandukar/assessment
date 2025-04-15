import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  /// The generated code assumes these values exist in JSON.
  final String id;
  final String title;
  final String content;
  final int dateTime;

  Item({
    required this.id,
    required this.title,
    required this.content,
    required this.dateTime,
  });

  /// Connect the generated [_$ItemFromJson] function to the `fromJson`
  /// factory.
  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  /// Connect the generated [_$ItemToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

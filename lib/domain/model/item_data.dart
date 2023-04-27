import 'package:json_annotation/json_annotation.dart';

part 'item_data.g.dart';

@JsonSerializable()
class ItemData {
  final String id;
  final ItemType type;
  final String image;
  final String site;
  final String title;
  final String description;

  ItemData({
    String? id,
    ItemType? type,
    required this.image,
    required this.site,
    String? title,
    String? description,
  })  : id = id ?? '',
        type = type ?? ItemType.news,
        title = title ?? '',
        description = description ?? '';

  factory ItemData.fromJson(Map<String, dynamic> json) =>
      _$ItemDataFromJson(json);

  Map<String, dynamic> toJson() => _$ItemDataToJson(this);

  @override
  String toString() {
    return 'ItemData{id: $id, type: $type, image: $image, site: $site, title: $title, description: $description}';
  }
}

enum ItemType {
  news,
  food,
  store,
  story, title,
}

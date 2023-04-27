// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemData _$ItemDataFromJson(Map<String, dynamic> json) => ItemData(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$ItemTypeEnumMap, json['type']),
      image: json['image'] as String,
      site: json['site'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ItemDataToJson(ItemData instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ItemTypeEnumMap[instance.type]!,
      'image': instance.image,
      'site': instance.site,
      'title': instance.title,
      'description': instance.description,
    };

const _$ItemTypeEnumMap = {
  ItemType.news: 'news',
  ItemType.food: 'food',
  ItemType.store: 'store',
  ItemType.story: 'story',
  ItemType.title: 'title',
};

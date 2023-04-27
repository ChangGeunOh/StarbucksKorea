// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodData _$FoodDataFromJson(Map<String, dynamic> json) => FoodData(
      id: json['id'] as String?,
      title: json['title'] as String?,
      titleEng: json['titleEng'] as String,
      price: json['price'] as int,
      description: json['description'] as String?,
      image: json['image'] as String,
      site: json['site'] as String,
      isBest: json['isBest'] as bool?,
      isNew: json['isNew'] as bool?,
      nutrition: (json['nutrition'] as List<dynamic>?)
          ?.map((e) => PairData.fromJson(e as Map<String, dynamic>))
          .toList(),
      allergy:
          (json['allergy'] as List<dynamic>?)?.map((e) => e as String).toList(),
      similarFoods: (json['similarFoods'] as List<dynamic>?)
          ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FoodDataToJson(FoodData instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'site': instance.site,
      'title': instance.title,
      'description': instance.description,
      'titleEng': instance.titleEng,
      'price': instance.price,
      'isBest': instance.isBest,
      'isNew': instance.isNew,
      'nutrition': instance.nutrition,
      'allergy': instance.allergy,
      'similarFoods': instance.similarFoods,
    };

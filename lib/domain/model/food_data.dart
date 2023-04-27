import 'package:json_annotation/json_annotation.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/domain/model/pair_data.dart';

part 'food_data.g.dart';

@JsonSerializable()
class FoodData extends ItemData {
  final String titleEng;
  final int price;
  final bool isBest;
  final bool isNew;
  final List<PairData> nutrition;
  final List<String> allergy;
  final List<ItemData> similarFoods;

  FoodData({
    super.id,
    required super.title,
    required this.titleEng,
    required this.price,
    super.description,
    required super.image,
    required super.site,
    bool? isBest,
    bool? isNew,
    List<PairData>? nutrition,
    List<String>? allergy,
    List<ItemData>? similarFoods,
  })  : nutrition = nutrition ?? <PairData>[],
        allergy = allergy ?? List.empty(),
        isBest = isBest ?? false,
        isNew = isNew ?? false,
        similarFoods = similarFoods ?? <ItemData>[];

  @override
  String toString() {
    return 'FoodData{titleEng: $titleEng, price: $price, isBest: $isBest, isNew: $isNew, nutrition: $nutrition, allergy: $allergy, similarFoods: $similarFoods}';
  }
}

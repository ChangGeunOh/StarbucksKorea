import 'package:starbucks/domain/model/food_data.dart';
import 'package:starbucks/domain/model/item_data.dart';

class FoodState {
  final FoodData foodData;
  final SheetState sheetState;

  FoodState({
    FoodData? foodData,
    List<ItemData>? similarFoods,
    SheetState? sheetState,
  })  : foodData = foodData ??
            FoodData(title: '', titleEng: '', price: 0, site: '', image: ''),
        sheetState = sheetState ?? SheetState.none;

  FoodState copyWith({
    FoodData? foodData,
    SheetState? sheetState,
  }) {
    return FoodState(
      foodData: foodData ?? this.foodData,
      sheetState: sheetState ?? this.sheetState,
    );
  }
}

enum SheetState { none, open, close }

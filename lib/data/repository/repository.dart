import 'package:starbucks/common/const/database.dart';
import 'package:starbucks/domain/model/food_data.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/domain/repository/database_source.dart';
import 'package:starbucks/domain/repository/datastore_source.dart';
import 'package:starbucks/domain/repository/network_source.dart';

class Repository {
  final DatabaseSource _databaseSource;
  final DataStoreSource _dataStoreSource;
  final NetworkSource _networkSource;

  Repository({
    required DatabaseSource databaseSource,
    required DataStoreSource dataStoreSource,
    required NetworkSource networkSource,
  })  : _databaseSource = databaseSource,
        _dataStoreSource = dataStoreSource,
        _networkSource = networkSource;

  Future<List<Object>> getProgram() async {
    // return _networkSource.getNews();
    await Future.delayed(const Duration(milliseconds: 200));
    return kProgram;
  }

  Future<FoodData> getFoodItem(String id) async {
    // Search FoodData using id in Database or Network
    return foods.first;
  }
}

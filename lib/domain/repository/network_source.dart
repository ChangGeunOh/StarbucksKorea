import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/domain/model/user_data.dart';

abstract class NetworkSource {
  Future<UserData> login(Map<String, dynamic> loginData);

  Future<List<ItemData>> getNews();
}
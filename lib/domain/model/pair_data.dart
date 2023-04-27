
import 'package:json_annotation/json_annotation.dart';

part 'pair_data.g.dart';

@JsonSerializable()
class PairData {
  final String key;
  final String value;

  PairData(this.key, this.value);
  
  Map<String, dynamic> toJson() => _$PairDataToJson(this);
  
  factory PairData.fromJson(Map<String, dynamic> json) => _$PairDataFromJson(json);
  
}
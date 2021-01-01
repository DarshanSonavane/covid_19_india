import 'package:json_annotation/json_annotation.dart';
import '../model/statewise.dart';

part 'data.g.dart';

@JsonSerializable()
class Data{

  List<Statewise> statewise;

  Data({this.statewise});

  factory Data.fromJson(Map<String,dynamic> json) => _$DataFromJson(json);

  Map<String,dynamic> toJson() => _$DataToJson(this);
}
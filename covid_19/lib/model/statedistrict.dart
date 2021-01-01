import 'package:json_annotation/json_annotation.dart';
import '../model/district.dart';

part 'statedistrict.g.dart';

@JsonSerializable()
class StateDistrict{

  String state;
  String statecode;
  List<District> districtData = null;

  StateDistrict({this.state,this.statecode,this.districtData});

  factory StateDistrict.fromJson(Map<String,dynamic> json) => _$StateDistrictFromJson(json);

  Map<String,dynamic> toJson() => _$StateDistrictToJson(this);
}
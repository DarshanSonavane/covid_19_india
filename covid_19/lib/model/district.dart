import 'package:json_annotation/json_annotation.dart';

part 'district.g.dart';

@JsonSerializable()
class District{

  String district;
  String notes;
  int active;
  int confirmed;
  int deceased;
  int recovered;

  District({this.district,this.notes,this.active,this.confirmed,this.deceased,this.recovered});

  factory District.fromJson(Map<String,dynamic> json) => _$DistrictFromJson(json);

  Map<String,dynamic> toJson() => _$DistrictToJson(this);
}
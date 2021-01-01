import 'package:json_annotation/json_annotation.dart';

part 'statewise.g.dart';

@JsonSerializable()
class Statewise{

  String active;
  String confirmed;
  String deaths;
  String recovered;
  String state;
  String statecode;
  String lastupdatedtime;

  Statewise({this.active,this.confirmed,this.deaths,this.recovered,this.state,this.statecode,this.lastupdatedtime});

  factory Statewise.fromJson(Map<String,dynamic> json) => _$StatewiseFromJson(json);

  Map<String,dynamic> toJson() => _$StatewiseToJson(this);
}
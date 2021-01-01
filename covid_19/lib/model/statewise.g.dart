// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statewise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Statewise _$StatewiseFromJson(Map<String, dynamic> json) {
  return Statewise(
    active: json['active'] as String,
    confirmed: json['confirmed'] as String,
    deaths: json['deaths'] as String,
    recovered: json['recovered'] as String,
    state: json['state'] as String,
    statecode: json['statecode'] as String,
    lastupdatedtime: json['lastupdatedtime'] as String,
  );
}

Map<String, dynamic> _$StatewiseToJson(Statewise instance) => <String, dynamic>{
      'active': instance.active,
      'confirmed': instance.confirmed,
      'deaths': instance.deaths,
      'recovered': instance.recovered,
      'state': instance.state,
      'statecode': instance.statecode,
      'lastupdatedtime': instance.lastupdatedtime,
    };

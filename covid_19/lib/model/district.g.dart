// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
    district: json['district'] as String,
    notes: json['notes'] as String,
    active: json['active'] as int,
    confirmed: json['confirmed'] as int,
    deceased: json['deceased'] as int,
    recovered: json['recovered'] as int,
  );
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'district': instance.district,
      'notes': instance.notes,
      'active': instance.active,
      'confirmed': instance.confirmed,
      'deceased': instance.deceased,
      'recovered': instance.recovered,
    };

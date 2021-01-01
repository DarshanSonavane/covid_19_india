// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statedistrict.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StateDistrict _$StateDistrictFromJson(Map<String, dynamic> json) {
  return StateDistrict(
    state: json['state'] as String,
    statecode: json['statecode'] as String,
    districtData: (json['districtData'] as List)
        ?.map((e) =>
            e == null ? null : District.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StateDistrictToJson(StateDistrict instance) =>
    <String, dynamic>{
      'state': instance.state,
      'statecode': instance.statecode,
      'districtData': instance.districtData,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
      (json['atasoz'] as List<dynamic>?)
          ?.map((e) => Atasoz.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kelime'] as List<dynamic>?)
          ?.map((e) => Kelime.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['syyd'] as List<dynamic>?)
          ?.map((e) => Syyd.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kural'] as List<dynamic>?)
          ?.map((e) => Kural.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Atasoz _$AtasozFromJson(Map<String, dynamic> json) => Atasoz(
      json['madde'] as String?,
      json['anlam'] as String?,
    );

Kelime _$KelimeFromJson(Map<String, dynamic> json) => Kelime(
      json['madde'] as String?,
      json['anlam'] as String?,
    );

Syyd _$SyydFromJson(Map<String, dynamic> json) => Syyd(
      json['yanliskelime'] as String?,
      json['dogrukelime'] as String?,
    );

Kural _$KuralFromJson(Map<String, dynamic> json) => Kural(
      json['adi'] as String?,
      json['url'] as String?,
    );

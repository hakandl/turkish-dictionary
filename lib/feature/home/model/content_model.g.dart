// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
      atasoz: (json['atasoz'] as List<dynamic>?)
          ?.map((e) => Atasoz.fromJson(e as Map<String, dynamic>))
          .toList(),
      kelime: (json['kelime'] as List<dynamic>?)
          ?.map((e) => Kelime.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Atasoz _$AtasozFromJson(Map<String, dynamic> json) => Atasoz(
      madde: json['madde'] as String?,
      anlam: json['anlam'] as String?,
    );

Kelime _$KelimeFromJson(Map<String, dynamic> json) => Kelime(
      madde: json['madde'] as String?,
      anlam: json['anlam'] as String?,
    );

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentModel _$ContentModelFromJson(Map<String, dynamic> json) => ContentModel(
      (json['atasoz'] as List<dynamic>?)
          ?.map((e) => Proverb.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kelime'] as List<dynamic>?)
          ?.map((e) => Word.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['syyd'] as List<dynamic>?)
          ?.map((e) => Syyd.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['kural'] as List<dynamic>?)
          ?.map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Proverb _$ProverbFromJson(Map<String, dynamic> json) => Proverb(
      json['madde'] as String?,
      json['anlam'] as String?,
    );

Word _$WordFromJson(Map<String, dynamic> json) => Word(
      json['madde'] as String?,
      json['anlam'] as String?,
    );

Syyd _$SyydFromJson(Map<String, dynamic> json) => Syyd(
      json['yanliskelime'] as String?,
      json['dogrukelime'] as String?,
    );

Rule _$RuleFromJson(Map<String, dynamic> json) => Rule(
      json['adi'] as String?,
      json['url'] as String?,
    );

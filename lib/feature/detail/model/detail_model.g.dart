// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      word: json['madde'] as String?,
      language: json['lisan'] as String?,
      pronunciation: json['telaffuz'] as String?,
      compound: json['birlesikler'] as String?,
      meaningsList: (json['anlamlarListe'] as List<dynamic>?)
          ?.map((e) => MeaningsList.fromJson(e as Map<String, dynamic>))
          .toList(),
      proverb: (json['atasozu'] as List<dynamic>?)
          ?.map((e) => Proverb.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MeaningsList _$MeaningsListFromJson(Map<String, dynamic> json) => MeaningsList(
      orderMeaning: json['anlam_sira'] as String?,
      meaning: json['anlam'] as String?,
      examplesList: (json['orneklerListe'] as List<dynamic>?)
          ?.map((e) => ExamplesList.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuresList: (json['ozelliklerListe'] as List<dynamic>?)
          ?.map((e) => FeaturesList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ExamplesList _$ExamplesListFromJson(Map<String, dynamic> json) => ExamplesList(
      example: json['ornek'] as String?,
      authorId: json['yazar_id'] as String?,
      author: (json['yazar'] as List<dynamic>?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
      authorId: json['yazar_id'] as String?,
      fullName: json['tam_adi'] as String?,
    );

FeaturesList _$FeaturesListFromJson(Map<String, dynamic> json) => FeaturesList(
      type: json['tur'] as String?,
      fullName: json['tam_adi'] as String?,
    );

Proverb _$ProverbFromJson(Map<String, dynamic> json) => Proverb(
      word: json['madde'] as String?,
      meaningsList: (json['anlamlarListe'] as List<dynamic>?)
          ?.map((e) => MeaningsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

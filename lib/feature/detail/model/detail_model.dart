import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable(createToJson: false)
class DetailModel {
  @JsonKey(name: 'madde')
  final String? word;
  @JsonKey(name: 'lisan')
  final String? language;
  @JsonKey(name: 'telaffuz')
  final String? pronunciation;
  @JsonKey(name: 'birlesikler')
  final String? compound;
  @JsonKey(name: 'anlamlarListe')
  final List<MeaningsList>? meaningsList;
  @JsonKey(name: 'atasozu')
  final List<Proverb>? proverb;

  DetailModel({this.word, this.language, this.pronunciation, this.compound, this.meaningsList, this.proverb});

  List<String>? get compoundList => compound?.split(',');

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return _$DetailModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class MeaningsList {
  @JsonKey(name: 'anlam_sira')
  final String? orderMeaning;
  @JsonKey(name: 'anlam')
  final String? meaning;
  @JsonKey(name: 'orneklerListe')
  final List<ExamplesList>? examplesList;
  @JsonKey(name: 'ozelliklerListe')
  final List<FeaturesList>? featuresList;

  MeaningsList({this.orderMeaning, this.meaning, this.examplesList, this.featuresList});

  factory MeaningsList.fromJson(Map<String, dynamic> json) {
    return _$MeaningsListFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class ExamplesList {
  @JsonKey(name: 'ornek')
  final String? example;
  @JsonKey(name: 'yazar_id')
  final String? authorId;
  @JsonKey(name: 'yazar')
  final List<Author>? author;

  ExamplesList({this.example, this.authorId, this.author});

  factory ExamplesList.fromJson(Map<String, dynamic> json) {
    return _$ExamplesListFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Author {
  @JsonKey(name: 'yazar_id')
  final String? authorId;
  @JsonKey(name: 'tam_adi')
  final String? fullName;

  Author({this.authorId, this.fullName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return _$AuthorFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class FeaturesList {
  @JsonKey(name: 'tur')
  final String? type;
  @JsonKey(name: 'tam_adi')
  final String? fullName;

  FeaturesList({this.type, this.fullName});

  factory FeaturesList.fromJson(Map<String, dynamic> json) {
    return _$FeaturesListFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Proverb {
  @JsonKey(name: 'madde')
  final String? word;
  @JsonKey(name: 'anlamlarListe')
  final List<MeaningsList>? meaningsList;

  Proverb({this.word, this.meaningsList});

  factory Proverb.fromJson(Map<String, dynamic> json) {
    return _$ProverbFromJson(json);
  }
}

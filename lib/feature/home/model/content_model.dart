import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable(createToJson: false)
class ContentModel {
  @JsonKey(name: 'atasoz')
  final List<Proverb>? proverb;
  @JsonKey(name: 'kelime')
  final List<Word>? word;
  final List<Syyd>? syyd;
  @JsonKey(name: 'kural')
  final List<Rule>? rule;

  ContentModel(this.proverb, this.word, this.syyd, this.rule);

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return _$ContentModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Proverb {
  @JsonKey(name: 'madde')
  final String? word;
  @JsonKey(name: 'anlam')
  final String? meaning;

  Proverb(this.word, this.meaning);

  factory Proverb.fromJson(Map<String, dynamic> json) {
    return _$ProverbFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Word {
  @JsonKey(name: 'madde')
  final String? word;
  @JsonKey(name: 'anlam')
  final String? meaning;

  Word(this.word, this.meaning);

  factory Word.fromJson(Map<String, dynamic> json) {
    return _$WordFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Syyd {
  @JsonKey(name: 'yanliskelime')
  final String? wrongWord;
  @JsonKey(name: 'dogrukelime')
  final String? correctWord;
  Syyd(this.wrongWord, this.correctWord);
  factory Syyd.fromJson(Map<String, dynamic> json) {
    return _$SyydFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Rule {
  @JsonKey(name: 'adi')
  final String? name;
  final String? url;

  Rule(this.name, this.url);
  factory Rule.fromJson(Map<String, dynamic> json) {
    return _$RuleFromJson(json);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'search_keyword_model.g.dart';

@JsonSerializable(createToJson: false)
class Word {
  @JsonKey(name: 'madde')
  final String? word;

  Word(this.word);

  factory Word.fromJson(Map<String, dynamic> json) {
    return _$WordFromJson(json);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'search_keyword_model.g.dart';

@JsonSerializable(createToJson: false)
class WordModel {
  @JsonKey(name: 'madde')
  final String? word;

  WordModel(this.word);

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return _$WordModelFromJson(json);
  }
}

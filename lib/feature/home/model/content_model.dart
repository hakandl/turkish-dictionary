import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable(createToJson: false)
class ContentModel {
  List<Atasoz>? atasoz;
  List<Kelime>? kelime;

  ContentModel({this.atasoz, this.kelime});

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return _$ContentModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Atasoz {
  String? madde;
  String? anlam;

  Atasoz({this.madde, this.anlam});

  factory Atasoz.fromJson(Map<String, dynamic> json) {
    return _$AtasozFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Kelime {
  String? madde;
  String? anlam;

  Kelime({this.madde, this.anlam});

  factory Kelime.fromJson(Map<String, dynamic> json) {
    return _$KelimeFromJson(json);
  }
}

import 'package:json_annotation/json_annotation.dart';

part 'content_model.g.dart';

@JsonSerializable(createToJson: false)
class ContentModel {
  final List<Atasoz>? atasoz;
  final List<Kelime>? kelime;
  final List<Syyd>? syyd;
  final List<Kural>? kural;

  ContentModel(this.atasoz, this.kelime, this.syyd, this.kural);

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return _$ContentModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Atasoz {
  final String? madde;
  final String? anlam;

  Atasoz(this.madde, this.anlam);

  factory Atasoz.fromJson(Map<String, dynamic> json) {
    return _$AtasozFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Kelime {
  final String? madde;
  final String? anlam;

  Kelime(this.madde, this.anlam);

  factory Kelime.fromJson(Map<String, dynamic> json) {
    return _$KelimeFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Syyd {
  @JsonKey(name: 'yanliskelime')
  final String? yanlisKelime;
  @JsonKey(name: 'dogrukelime')
  final String? dogruKelime;
  Syyd(this.yanlisKelime, this.dogruKelime);
  factory Syyd.fromJson(Map<String, dynamic> json) {
    return _$SyydFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Kural {
  final String? adi;
  final String? url;

  Kural(this.adi, this.url);
  factory Kural.fromJson(Map<String, dynamic> json) {
    return _$KuralFromJson(json);
  }
}

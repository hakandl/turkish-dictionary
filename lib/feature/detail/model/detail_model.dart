import 'package:json_annotation/json_annotation.dart';

part 'detail_model.g.dart';

@JsonSerializable(createToJson: false)
class DetailModel {
  String? madde;
  String? lisan;
  String? telaffuz;
  String? birlesikler;
  List<AnlamlarListe>? anlamlarListe;
  List<Atasozu>? atasozu;

  DetailModel({this.madde, this.lisan, this.telaffuz, this.birlesikler, this.anlamlarListe, this.atasozu});

  List<String>? get birlesiklerList => birlesikler?.split(',');

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return _$DetailModelFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class AnlamlarListe {
  @JsonKey(name: 'anlam_sira')
  String? anlamSira;
  String? anlam;
  List<OrneklerListe>? orneklerListe;
  List<OzelliklerListe>? ozelliklerListe;

  AnlamlarListe({this.anlamSira, this.anlam, this.orneklerListe, this.ozelliklerListe});

  factory AnlamlarListe.fromJson(Map<String, dynamic> json) {
    return _$AnlamlarListeFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class OrneklerListe {
  String? ornek;
  @JsonKey(name: 'yazar_id')
  String? yazarId;
  List<Yazar>? yazar;

  OrneklerListe({this.ornek, this.yazarId, this.yazar});

  factory OrneklerListe.fromJson(Map<String, dynamic> json) {
    return _$OrneklerListeFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Yazar {
  String? yazarId;
  @JsonKey(name: 'tam_adi')
  String? tamAdi;

  Yazar({this.yazarId, this.tamAdi});

  factory Yazar.fromJson(Map<String, dynamic> json) {
    return _$YazarFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class OzelliklerListe {
  String? tur;
  @JsonKey(name: 'tam_adi')
  String? tamAdi;

  OzelliklerListe({this.tur, this.tamAdi});

  factory OzelliklerListe.fromJson(Map<String, dynamic> json) {
    return _$OzelliklerListeFromJson(json);
  }
}

@JsonSerializable(createToJson: false)
class Atasozu {
  String? madde;
  List<AnlamlarListe>? anlamlarListe;

  Atasozu({this.madde, this.anlamlarListe});

  factory Atasozu.fromJson(Map<String, dynamic> json) {
    return _$AtasozuFromJson(json);
  }
}

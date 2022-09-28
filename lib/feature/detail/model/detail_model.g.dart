// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => DetailModel(
      madde: json['madde'] as String?,
      lisan: json['lisan'] as String?,
      telaffuz: json['telaffuz'] as String?,
      birlesikler: json['birlesikler'] as String?,
      anlamlarListe: (json['anlamlarListe'] as List<dynamic>?)
          ?.map((e) => AnlamlarListe.fromJson(e as Map<String, dynamic>))
          .toList(),
      atasozu: (json['atasozu'] as List<dynamic>?)
          ?.map((e) => Atasozu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

AnlamlarListe _$AnlamlarListeFromJson(Map<String, dynamic> json) =>
    AnlamlarListe(
      anlamSira: json['anlam_sira'] as String?,
      anlam: json['anlam'] as String?,
      orneklerListe: (json['orneklerListe'] as List<dynamic>?)
          ?.map((e) => OrneklerListe.fromJson(e as Map<String, dynamic>))
          .toList(),
      ozelliklerListe: (json['ozelliklerListe'] as List<dynamic>?)
          ?.map((e) => OzelliklerListe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

OrneklerListe _$OrneklerListeFromJson(Map<String, dynamic> json) =>
    OrneklerListe(
      ornek: json['ornek'] as String?,
      yazarId: json['yazar_id'] as String?,
      yazar: (json['yazar'] as List<dynamic>?)
          ?.map((e) => Yazar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Yazar _$YazarFromJson(Map<String, dynamic> json) => Yazar(
      yazarId: json['yazarId'] as String?,
      tamAdi: json['tam_adi'] as String?,
    );

OzelliklerListe _$OzelliklerListeFromJson(Map<String, dynamic> json) =>
    OzelliklerListe(
      tur: json['tur'] as String?,
      tamAdi: json['tam_adi'] as String?,
    );

Atasozu _$AtasozuFromJson(Map<String, dynamic> json) => Atasozu(
      madde: json['madde'] as String?,
      anlamlarListe: (json['anlamlarListe'] as List<dynamic>?)
          ?.map((e) => AnlamlarListe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

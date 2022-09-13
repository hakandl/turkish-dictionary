class Word {
  String? madde;

  Word({this.madde});

  Word.fromJson(Map<String, dynamic> json) {
    madde = json['madde'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['madde'] = madde;
    return data;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkce_sozluk/feature/search/view/search_view.dart';

import '../model/search_keyword_model.dart';

abstract class SearchViewModel extends State<SearchView> {
  Future loadKeyword() async {
    final response = await rootBundle.loadString('assets/data/autocomplete.json');
    String jsonKeyword = response;
    final jsonResponse = json.decode(jsonKeyword) as List;
    data = jsonResponse.map((e) => Word.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    searchTextField = TextEditingController();
    loadKeyword();
  }

  late final TextEditingController searchTextField;
  List<Word> data = [];
  List<Word> filteredData = [];
  void insertSpecialWord(String word, TextEditingController insertWord) {
    var text = insertWord.text;
    var pos = insertWord.selection.start;
    insertWord.value = TextEditingValue(
      text: text.substring(0, pos) + word + text.substring(pos),
      selection: TextSelection.collapsed(offset: pos + word.length),
    );
  }

  void runFilter(String text) {
    List<Word> results = [];
    if (text.isEmpty) {
      results = data;
    } else {
      results = data.where((element) => element.madde!.toLowerCase().startsWith(text.toLowerCase())).toList();
    }
    setState(() => filteredData = results);
  }
}

enum SpecialWordEnum {
  c('ç'),
  g('ğ'),
  i('ı'),
  o('ö'),
  s('ş'),
  u('ü'),
  a('â'),
  ii('î'),
  uu('û');

  const SpecialWordEnum(this.value);
  final String value;
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turkce_sozluk/product/utils/loading.dart';

import '../model/search_keyword_model.dart';

class SearchViewModel extends LoadingStateful {
  late final TextEditingController searchTextField;
  List<WordModel> data = [];
  List<WordModel> filteredData = [];

  SearchViewModel() {
    searchTextField = TextEditingController();
    _loadKeyword();
  }

  Future<void> _loadKeyword() async {
    final response = await rootBundle.loadString('assets/data/autocomplete.json');
    final jsonResponse = await compute(jsonDecode, response) as List;
    data = jsonResponse.map((e) => WordModel.fromJson(e)).toList();
  }

  void runFilter(String text) {
    List<WordModel> results = [];
    if (text.isEmpty) {
      results = data;
    } else {
      results = data.where((element) => element.word!.toLowerCase().startsWith(text.toLowerCase())).toList();
    }
    filteredData = results;
    notifyListeners();
  }

  void insertSpecialWord(String word, TextEditingController insertWord) {
    final pos = insertWord.selection;
    final text = insertWord.text.replaceRange(pos.start, pos.end, word);

    insertWord.value = TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: pos.baseOffset + word.length),
    );
    /* insertWord.value = TextEditingValue(
      text: text.substring(0, pos) + word + text.substring(pos),
      selection: TextSelection.collapsed(offset: pos + word.length),
    ); */
    notifyListeners();
  }
}

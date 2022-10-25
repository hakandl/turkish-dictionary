import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../product/constants/enums/string/string_constants.dart';
import '../../../product/utils/loading.dart';

import '../model/search_keyword_model.dart';

class SearchViewModel extends LoadingStateful {
  late final TextEditingController searchTextField;
  List<WordModel> data = [];
  List<WordModel> filteredData = [];

  SearchViewModel() {
    searchTextField = TextEditingController();
    _loadWord();
  }

  Future<void> _loadWord() async {
    final response = await rootBundle.loadString(TurkishDictionaryStringConstants.searchListJsonResponse);
    final jsonResponse = await compute(jsonDecode, response) as List;
    data = jsonResponse.map((e) => WordModel.fromJson(e)).toList();
  }

  void wordFilter(String text) {
    List<WordModel> results = [];
    if (text.isEmpty) {
      results = data;
    } else {
      results = data.where((element) => element.word!.toLowerCase().startsWith(text.toLowerCase())).toList();
    }
    filteredData = results;
    notifyListeners();
  }

  void insertSpecialWord(String word) {
    final String text = searchTextField.text;
    final int selection = searchTextField.selection.start;
    searchTextField.value = TextEditingValue(
      text: text.substring(0, selection) + word + text.substring(selection),
      selection: TextSelection.collapsed(offset: selection + word.length),
    );
    notifyListeners();
  }

  void clearText() {
    searchTextField.clear();
    notifyListeners();
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:turkce_sozluk/feature/detail/model/detail_model.dart';

abstract class ICacheManager<T> {
  final String key;
  Box<DetailModel>? _box;

  ICacheManager(this.key);
  Future<void> init() async {
    if (!(_box?.isOpen == false)) {
      _box = await Hive.openBox(key);
    }
  }

  Future<void> clearWord(String key) async {
    await _box?.clear();
  }

  Future<void> addWord(List<T> word);
  Future<void> putWords(List<T> word);
  T? getWord(String key);
  Future<void> putWord(String key, T word);
  Future<void> deleteWord(String key);
}

class WordCacheManager extends ICacheManager<DetailModel> {
  WordCacheManager(String key) : super(key);

  @override
  Future<void> addWord(List<DetailModel> word) async {
    await _box?.addAll(word);
  }

  @override
  Future<void> putWords(List<DetailModel> word) async {
    await _box?.putAll(Map.fromEntries(word.map((e) => MapEntry(e.word, e))));
  }

  @override
  DetailModel? getWord(String key) {
    return _box?.get(key);
  }

  @override
  Future<void> putWord(String key, DetailModel word) async {
    await _box?.put(key, word);
  }

  @override
  Future<void> deleteWord(String key) async {
    await _box?.delete(key);
  }
}

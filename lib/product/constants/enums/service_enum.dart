enum ServiceEnum {
  icerik,
  gts,
  ara,
  gif;

  String get withSlash => '/$name';
  String get withQuestionMark => '?$name=';
  String get withDot => '.$name';
}

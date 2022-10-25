enum ServiceEnum {
  content('icerik'),
  gts('gts'),
  search('ara'),
  gif('gif');

  const ServiceEnum(this.value);
  final String value;

  String get withSlash => '/$value';
  String get withQuestionMark => '?$value=';
  String get withDot => '.$name';
}

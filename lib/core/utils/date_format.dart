class DateFormat {
  DateFormat._();

  static String mdKorean(DateTime d) {
    return '${d.month}월 ${d.day}일';
  }

  static String mdKoreanHm(DateTime d) {
    return '${mdKorean(d)} ${hm(d)}';
  }

  static String ymdKorean(DateTime d) {
    return '${d.year}년 ${d.month}월 ${d.day}일';
  }

  static String hm(DateTime d) {
    return '${_two(d.hour)}:${_two(d.minute)}';
  }

  static String _two(int v) => v.toString().padLeft(2, '0');
}
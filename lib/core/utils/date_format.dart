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

  static String ymdKoreanAmPm(DateTime d) {
    return '${ymdKorean(d)} ${amPmHm(d)}';
  }

  static String amPmHm(DateTime d) {
    final isAm = d.hour < 12;
    final hour = d.hour % 12 == 0 ? 12 : d.hour % 12;

    final period = isAm ? '오전' : '오후';

    return '$period ${_two(hour)}:${_two(d.minute)}';
  }

  static String _two(int v) => v.toString().padLeft(2, '0');
}
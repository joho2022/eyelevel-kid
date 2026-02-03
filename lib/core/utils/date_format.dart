class DateFormat {
  DateFormat._();

  static String ymd(DateTime d) {
    return '${d.year}-${_two(d.month)}-${_two(d.day)}';
  }

  static String hm(DateTime d) {
    return '${_two(d.hour)}:${_two(d.minute)}';
  }

  static String _two(int v) => v.toString().padLeft(2, '0');
}
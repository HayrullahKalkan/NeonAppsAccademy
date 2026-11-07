extension MyDateTimeExtension on DateTime {
  int muchDateTime(DateTime other) {
    return other.difference(this).inDays;
  }
}

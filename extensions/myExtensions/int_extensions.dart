extension MyIntExtension on int {
  bool isPrime() {
    int i;

    i = 2;
    if (this < 2) {
      return (false);
    }
    if (this == 2) {
      return (true);
    }
    while (i <= this / 2) {
      if (this % i == 0) {
        return (false);
      }
      i++;
    }
    return (true);
  }
}

extension myStringExtensions on String {
  bool isPalindrome() {
    int i;
    int j;

    i = 0;
    j = this.length - 1;
    String str = this;
    while (j > this.length / 2) {
      if (str[i] != str[j]) return false;
      i++;
      j--;
    }
    return true;
  }
}

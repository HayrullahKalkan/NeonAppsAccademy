extension MyMapExtensions on List<String> {
  Map<String, List<String>> surnameGroups() {
    Map<String, List<String>> groups = {};

    for (var person in this) {
      List<String> nameParts = person.split(' ');

      String name = nameParts.first;
      String surname = nameParts.last;

      if (groups.containsKey(surname)) {
        groups[surname]!.add(name);
      } else {
        groups[surname] = [name];
      }
    }

    return groups;
  }
}

import 'utils/member_printer.dart';
import 'data/member_data.dart';
import 'services/member_service.dart';

void runSection(String title, void Function() action) {
  print('\n================================');
  print(title);
  print('================================');
  action();
}

void main() {
  runSection('INITIAL MEMBERS', () {
    printMembers(members);
  });

  runSection('REMOVE THIRD MEMBER', () {
    removeThirdMember(members);
  });

  runSection('SORT MEMBERS BY AGE', () {
    sortAge(members);
  });

  runSection('SORT MEMBERS BY NAME', () {
    sortName(members);
  });

  runSection('MEMBERS OLDER THAN 24', () {
    AgeBigTwentyFour(members);
  });

  runSection('IOS DEVELOPER COUNT', () {
    iosDeveloperCount(members);
  });

  runSection('FIND MY INDEX', () {
    whereAmI(members);
  });

  runSection('ADD MENTOR', () {
    masterMentrAdd(members);
  });

  runSection('REMOVE A1 MEMBERS', () {
    removeAlevel(members);
  });

  runSection('OLDEST MEMBER', () {
    oldMember(members);
  });

  runSection('LONGEST MEMBER NAME', () {
    memberLongName(members);
  });

  runSection('GROUP BY HOROSCOPE', () {
    groupMembersByHoroscope(members);
  });

  runSection('GROUP BY HOMETOWN', () {
    membersOftencity(members);
  });

  runSection('AVERAGE AGE', () {
    membersAgeAvarage(members);
  });

  runSection('CONTACT INFORMATION', () {
    membersContactInfo(members);
  });

  runSection('SORT MEMBERS BY MEMBERLEVEL', () {
    sortMembersLevel(members);
  });

  runSection('GROUP BY TITLE', () {
    groupMembersTitle(members);
  });
}

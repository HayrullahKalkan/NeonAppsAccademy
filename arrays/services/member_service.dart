import '../models/neon_academy_member.dart';
import '../models/contact_information.dart';
import '../utils/member_printer.dart';

void membersContactInfo(List<NeonAcademyMember> members) {
  List<ContactInformation> contactInfoList = [];
  for (var member in members) {
    contactInfoList.add(member.contactInformation);
  }
  for (var contactInfo in contactInfoList) {
    print('Email: ${contactInfo.email}');
    print('Phone Number: ${contactInfo.phoneNumber}');
    print('-------------------------');
  }
}

void groupMembersByHoroscope(List<NeonAcademyMember> members) {
  Map<String, List<NeonAcademyMember>> horoscopeGroups = {};
  for (var member in members) {
    if (horoscopeGroups.containsKey(member.horoscope)) {
      horoscopeGroups[member.horoscope]!.add(member);
    } else {
      horoscopeGroups[member.horoscope] = [member];
    }
  }
  horoscopeGroups.forEach((horoscope, members) {
    print('$horoscope Members:');
    printMemberNames(members);
  });
}

void groupMembersTitle(List<NeonAcademyMember> members) {
  Map<String, List<NeonAcademyMember>> titleGroups = {};
  for (var member in members) {
    if (titleGroups.containsKey(member.title)) {
      titleGroups[member.title]!.add(member);
    } else {
      titleGroups[member.title] = [member];
    }
  }
  titleGroups.forEach((titleGroups, members) {
    print('$titleGroups Members :');
    printMemberNames(members);
  });
}

void membersAgeAvarage(List<NeonAcademyMember> members) {
  int totalAge = 0;

  for (var member in members) {
    totalAge += member.age;
  }
  print('Average age of members: ${totalAge / members.length}');
}

void membersOftencity(List<NeonAcademyMember> members) {
  Map<String, List<NeonAcademyMember>> homeTownGroups = {};

  for (var member in members) {
    if (homeTownGroups.containsKey(member.homeTown)) {
      homeTownGroups[member.homeTown]!.add(member);
    } else {
      homeTownGroups[member.homeTown] = [member];
    }
  }
  homeTownGroups.forEach((town, members) {
    print('$town: ${members.length}');
  });
}

void removeThirdMember(List<NeonAcademyMember> members) {
  members.removeAt(2);
  print('Removed member at index 2\n');
}

void sortAge(List<NeonAcademyMember> members) {
  members.sort((a, b) => b.age.compareTo(a.age));
  print('Sorted members by age in descending order\n \n');
  printMemberNames(members);
}

void sortName(List<NeonAcademyMember> members) {
  members.sort((a, b) => a.fullName.compareTo(b.fullName));
  print('Sorted members by full name in ascending order\n');
  printMemberNames(members);
}

void AgeBigTwentyFour(List<NeonAcademyMember> members) {
  List<NeonAcademyMember> bigTwentyFour = [];

  members.where((member) => member.age > 24).forEach((member) {
    bigTwentyFour.add(member);
  });

  printMemberNames(bigTwentyFour);
}

void iosDeveloperCount(List<NeonAcademyMember> members) {
  int count = members.where((member) => member.title == 'IOS Developer').length;
  print('Number of IOS Developers: $count');
}

void whereAmI(List<NeonAcademyMember> members) {
  int iAm = 0;
  for (int i = 0; i < members.length; i++) {
    if (members[i].fullName == 'Hayrullah Kalkan') {
      iAm = i;
    }
  }
  if (iAm == 0)
    print("Member not found");
  else
    print("My index = $iAm");
}

void masterMentrAdd(List<NeonAcademyMember> members) {
  members.add(
    NeonAcademyMember(
      fullName: 'Mehmet Nuri',
      title: 'flutter Mentor',
      horoscope: 'lion',
      memberLevel: 'C2',
      mentorLevel: 'Master Mentor',
      homeTown: 'Istanbul',
      age: 26,
      contactInformation: ContactInformation(
        email: 'mehmet.nuri@example.com',
        phoneNumber: '555-123-4567',
      ),
    ),
  );
  printMemberNames(members);
}

void removeAlevel(List<NeonAcademyMember> members) {
  members.removeWhere((member) => member.memberLevel == 'A1');
  print('Removed members with A1 member level\n \n');
  printMemberNames(members);
}

void oldMember(List<NeonAcademyMember> members) {
  int a = 0;
  int b = 0;
  for (int i = 0; i < members.length; i++) {
    if (members[i].age > a) {
      a = members[i].age;
      b = i;
    }
  }
  print('The oldest member is: ${members[b].fullName}, Age: ${members[b].age}');
}

void sortMembersLevel(List<NeonAcademyMember> members) {
  const levels = ['A1', 'A2', 'B1', 'B2', 'C1', 'C2'];
  members.sort((a, b) {
    return levels
        .indexOf(b.memberLevel)
        .compareTo(levels.indexOf(a.memberLevel));
  });
  printMemberNames(members);
}

void memberLongName(List<NeonAcademyMember> members) {
  int a = 0;
  int b = 0;
  for (int i = 0; i < members.length; i++) {
    if (members[i].fullName.length > a) {
      a = members[i].fullName.length;
      b = i;
    }
  }
  print(
    'The member with the longest full name is: ${members[b].fullName}, Length: ${members[b].fullName.length}',
  );
}

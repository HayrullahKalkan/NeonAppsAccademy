import '../models/contact_information.dart';
import '../models/team.dart';
import '../models/neon_academy_member.dart';
import '../utils/utils.dart';

void teamsCount(List<NeonAcademyMember> members) {
  Map<Team, int> teamsCount = {};

  for (var member in members) {
    if (teamsCount.containsKey(member.team)) {
      teamsCount[member.team] = teamsCount[member.team]! + 1;
    } else {
      teamsCount[member.team] = 1;
    }
  }

  teamsCount.forEach((team, count) {
    print('$team: $count members');
  });

  print('UI/UX Design Team: ${teamsCount[Team.uiUxDesign] ?? 0} members');
}

void findFlutterDeveloper(List<NeonAcademyMember> members) {
  List<NeonAcademyMember> membersFlutter = [];
  membersFlutter = members
      .where((member) => member.team == Team.flutterDevelopment)
      .toList();
  printMemberNames(membersFlutter);
}

void searchTeams(Team team, List<NeonAcademyMember> members) {
  for (int i = 0; i < members.length; i++) {
    if (team == members[i].team) {
      print("${members[i].fullName}");
    }
  }
}

void checkMemberTeam(NeonAcademyMember member) {
  switch (member.team) {
    case Team.flutterDevelopment:
      print('${member.fullName} This member is a skilled Flutter developer');
      break;

    case Team.iosDevelopment:
      print('${member.fullName} This member is a skilled iOS developer');
      break;

    case Team.androidDevelopment:
      print('${member.fullName} This member is a skilled Android developer');
      break;

    case Team.uiUxDesign:
      print('${member.fullName} This member is a talented designer');
      break;
  }
}

void searchAge(int age, List<NeonAcademyMember> members, Team team) {
  for (int i = 0; i < members.length; i++) {
    if (members[i].age > age && members[i].team == team) {
      print("${members[i].fullName}");
    }
  }
}

void membersMesage(List<NeonAcademyMember> members) {
  for (var member in members) {
    checkMemberTeam(member);
  }
}

void memberPromotionCheck(NeonAcademyMember member) {
  switch (member.team) {
    case Team.flutterDevelopment:
      if (member.memberLevel == 'C2') {
        member.title = "Senior Flutter Developer";
      }
      break;
    case Team.androidDevelopment:
      if (member.memberLevel == 'C2') {
        member.title = "Senior Android Developer";
      }
      break;
    case Team.iosDevelopment:
      if (member.memberLevel == 'C2') {
        member.title = "Senior IOS Developer";
      }
      break;
    case Team.uiUxDesign:
      if (member.memberLevel == 'C2') {
        member.title = "Lead Designer";
      }
      break;
  }
}

void memberPromotion(List<NeonAcademyMember> members) {
  for (var member in members) {
    memberPromotionCheck(member);
  }
}

double teamAverage(List<NeonAcademyMember> members, Team team) {
  double count = 0;
  int i = 0;
  for (var member in members) {
    if (member.team == team) {
      count += member.age;
      i++;
    }
  }
  if (i == 0) return 0;
  count = count / i;
  return count;
}

void TeamsMessages(Team team) {
  switch (team) {
    case Team.flutterDevelopment:
      print('Flutter Team is the backbone of our academy');
      break;

    case Team.iosDevelopment:
      print('iOS Team is the innovation center of our academy');
      break;

    case Team.androidDevelopment:
      print('Android Team is the power of our academy');
      break;

    case Team.uiUxDesign:
      print('UI/UX Design Team is the face of our academy');
      break;
  }
}

List<ContactInformation> getTeamContactInformation(
  List<NeonAcademyMember> members,
  Team team,
) {
  return members
      .where((member) => member.team == team)
      .map((member) => member.contactInformation)
      .toList();
}

void checkMemberTeamAge(NeonAcademyMember member) {
  switch (member.team) {
    case Team.androidDevelopment:
      if (member.age > 23) {
        print("${member.fullName} is an experienced Android developer.");
      } else {
        print("${member.fullName} is a rising talent in Android development");
      }
      break;
    case Team.flutterDevelopment:
      if (member.age > 23) {
        print("${member.fullName} is a seasoned Flutter developer.");
      } else {
        print("${member.fullName} is a promising Flutter developer.");
      }
      break;
    case Team.iosDevelopment:
      if (member.age > 23) {
        print("${member.fullName} is an experienced iOS developer.");
      } else {
        print("${member.fullName} is a rising talent in iOS development.");
      }
      break;
    case Team.uiUxDesign:
      if (member.age < 24) {
        print("${member.fullName} is a rising star in the design world.");
      } else {
        print("${member.fullName} is an experienced UI/UX designer.");
      }
  }
}

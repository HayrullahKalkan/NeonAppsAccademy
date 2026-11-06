import 'models/team.dart';
import 'data/member_data.dart';
import 'services/member_service.dart';

void main() {
  print('\n========== 1. FLUTTER TEAM MEMBERS ==========');
  findFlutterDeveloper(members);

  print('\n========== 2. TEAM MEMBER COUNTS ==========');
  teamsCount(members);

  print('\n========== 3. SEARCH TEAM MEMBERS ==========');
  searchTeams(Team.androidDevelopment, members);

  print('\n========== 4. TEAM BASED SWITCH ==========');
  membersMesage(members);

  print('\n========== 5. AGE AND TEAM FILTER ==========');
  searchAge(23, members, Team.flutterDevelopment);

  print('\n========== 6. MEMBER PROMOTIONS ==========');
  memberPromotion(members);

  for (var member in members) {
    print('${member.fullName} -> ${member.title}');
  }

  print('\n========== 7. TEAM AVERAGE AGE ==========');
  final averageAge = teamAverage(members, Team.flutterDevelopment);
  print('Flutter Team Average Age: $averageAge');

  print('\n========== 8. TEAM MESSAGES ==========');
  for (var team in Team.values) {
    TeamsMessages(team);
  }

  print('\n========== 9. TEAM CONTACT INFORMATION ==========');
  final contacts = getTeamContactInformation(members, Team.flutterDevelopment);

  for (var contact in contacts) {
    print('Email: ${contact.email}');
    print('Phone: ${contact.phoneNumber}');
  }

  print('\n========== 10. TEAM AND AGE BASED SWITCH ==========');
  for (var member in members) {
    checkMemberTeamAge(member);
  }
}

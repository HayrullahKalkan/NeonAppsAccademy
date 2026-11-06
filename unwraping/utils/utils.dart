import '../models/neon_academy_member.dart';

void printMemberNames(List<NeonAcademyMember> members) {
  for (var member in members) {
    print(member.fullName);
  }
}

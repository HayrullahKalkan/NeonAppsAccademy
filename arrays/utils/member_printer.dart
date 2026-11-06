import '../models/neon_academy_member.dart';

void printMembers(List<NeonAcademyMember> members) {
  for (var member in members) {
    print('Full Name: ${member.fullName}');
    print('Title: ${member.title}');
    print('Horoscope: ${member.horoscope}');
    print('Member Level: ${member.memberLevel}');
    print('Home Town: ${member.homeTown}');
    print('Age: ${member.age}');
    print('Email: ${member.contactInformation.email}');
    print('Phone Number: ${member.contactInformation.phoneNumber}');
    print('-------------------------');
  }
}

void printMemberNames(List<NeonAcademyMember> members) {
  for (var member in members) {
    print(member.fullName);
  }
}

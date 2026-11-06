import '../models/contact_information.dart';
import 'team.dart';

class NeonAcademyMember {
  final String fullName;
  String title;
  final String horoscope;
  final String memberLevel;
  final String homeTown;
  final int age;
  int? motivationLevel;
  final ContactInformation contactInformation;
  Team team;
  NeonAcademyMember({
    required this.fullName,
    required this.title,
    required this.horoscope,
    required this.memberLevel,
    required this.homeTown,
    required this.age,
    required this.contactInformation,
    required this.team,
    this.motivationLevel = null,
  });
}

import 'models/neon_academy_member.dart';
import 'models/contact_information.dart';

void main() {
  List<NeonAcademyMember> members = [
    NeonAcademyMember(
      fullName: 'John Doe',
      title: 'Software Engineer',
      horoscope: 'Gemini',
      memberLevel: 'Gold',
      homeTown: 'New York',
      age: 30,
      contactInformation: ContactInformation(
        email: 'john.doe@example.com',
        phoneNumber: '123-456-7890',
      ),
    ),
    NeonAcademyMember(
      fullName: 'Jane Smith',
      title: 'Product Manager',
      horoscope: 'Leo',
      memberLevel: 'Platinum',
      homeTown: 'Los Angeles',
      age: 28,
      contactInformation: ContactInformation(
        email: 'jane.smith@example.com',
        phoneNumber: '098-765-4321',
      ),
    ),
    NeonAcademyMember(
      fullName: 'Alice Johnson',
      title: 'UX Designer',
      horoscope: 'Pisces',
      memberLevel: 'Silver',
      homeTown: 'Chicago',
      age: 25,
      contactInformation: ContactInformation(
        email: 'alice.johnson@example.com',
        phoneNumber: '555-123-4567',
      ),
    ),
  ];

  for (var member in members) {
    print('Full Name: ${member.fullName}');
    print('Title: ${member.title}');
    print('Horoscope: ${member.horoscope}');
    print('Member Level: ${member.memberLevel}');
    print('Home Town: ${member.homeTown}');
    print('Age: ${member.age}');
    print('Email: ${member.contactInformation.email}');
    print('Phone Number: ${member.contactInformation.phoneNumber}');
    print('-----------------------------');
  }
}

import 'services/member_service.dart';
import 'data/member_data.dart';

void main() {
  members[0].motivationLevel = null;
  members[1].motivationLevel = 3;
  members[2].motivationLevel = 7;

  print('--- TEST 1: increaseMotivation ---');

  increaseMotivation(members[0], 3);
  print('${members[0].fullName}: ${members[0].motivationLevel}');

  increaseMotivation(members[1], 2);
  print('${members[1].fullName}: ${members[1].motivationLevel}');

  print('\n--- TEST 2: memberGuardLet ---');

  // Null kontrolü için tekrar null yapıyoruz.
  members[0].motivationLevel = null;

  memberGuardLet(members[0]);
  memberGuardLet(members[1]);
  memberGuardLet(members[2]);

  print('\n--- TEST 3: motivatedLevel ---');

  print(motivatedLevel(null));
  print(motivatedLevel(0));
  print(motivatedLevel(3));
  print(motivatedLevel(8));

  print('\n--- TEST 4: targetLevel ---');

  print(targetLevel(members[0], 5));
  print(targetLevel(members[1], 5));
  print(targetLevel(members[2], 5));
}

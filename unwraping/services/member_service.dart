import '../models/neon_academy_member.dart';

void increaseMotivation(NeonAcademyMember member, int amount) {
  if (member.motivationLevel == null) {
    member.motivationLevel = 1;
  } else {
    member.motivationLevel = (member.motivationLevel ?? 0) + amount;
  }
}

void memberGuardLet(NeonAcademyMember member) {
  if (member.motivationLevel == null) {
    print("This member has no motivation level set");
  } else if ((member.motivationLevel ?? 0) >= 0 &&
      (member.motivationLevel ?? 0) <= 5) {
    print("This member is moderately motivated");
  } else {
    print("This member is highly motivated");
  }
}

String motivatedLevel(int? motLevel) {
  String message = "";

  if (motLevel == null || motLevel == 0) {
    message = "Not motivated at all";
  } else if (motLevel >= 1 && motLevel <= 5) {
    message = "Moderately motivated";
  } else {
    message = "Highly motivated";
  }
  return message;
}

bool targetLevel(NeonAcademyMember member, int targetMotLevel) {
  if ((member.motivationLevel ?? 0) >= targetMotLevel) {
    return true;
  }
  return false;
}

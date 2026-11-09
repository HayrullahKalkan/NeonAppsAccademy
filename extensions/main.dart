import 'myExtensions/bool_extensions.dart';
import 'myExtensions/date_time_extensions.dart';
import 'myExtensions/int_extensions.dart';
import 'myExtensions/map_extensions.dart';
import 'myExtensions/set_extensions.dart';
import 'myExtensions/string_extensions.dart';

void main() {
  String str = 'kabak';
  String str1 = 'neon';

  print('--- STRING EXTENSION ---');
  print(str.isPalindrome());
  print(str1.isPalindrome());
  int a = 8;
  int b = 5;
  print('--- INT EXTENSION ---');
  print(a.isPrime());
  print(b.isPrime());

  print('\n--- DATETIME EXTENSION ---');

  DateTime firstDate = DateTime(2026, 1, 1);
  DateTime secondDate = DateTime(2026, 1, 10);
  print('Days between dates: ${firstDate.muchDateTime(secondDate)}');

  print('\n--- BOOL EXTENSION ---');

  bool firstValue = true;
  bool secondValue = false;

  print('and :${firstValue.and(secondValue)}');
  print('or  :${firstValue.or(secondValue)}');
  print('not :${firstValue.not()}');
  print('xor :${firstValue.xor(secondValue)}');

  print('\n--- SET EXTENSION ---');

  List<String> complaints = [
    'Internet is slow',
    'Food is cold',
    'Internet is slow',
    'Room is dirty',
    'Food is cold',
  ];

  print('Original complaints: $complaints');
  print('Unique complaints: ${complaints.noDuplicate()}');
  print('\n--- MAP EXTENSION ---');

  List<String> people = [
    'Hayrullah Kalkan',
    'Ahmet Yılmaz',
    'Mehmet Kalkan',
    'Ayşe Yılmaz',
    'Taha Demir',
  ];

  Map<String, List<String>> families = people.surnameGroups();

  families.forEach((surname, names) {
    print('$surname family: $names');
  });
}

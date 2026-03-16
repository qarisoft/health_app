import 'dart:io';
import 'dart:convert';

void main() {
  final file = File('c:/Users/salah/dev/labeeb/health_app/translations.json');
  if (!file.existsSync()) {
    print('translations.json not found');
    return;
  }
  
  final content = file.readAsStringSync();
  final data = jsonDecode(content) as Map<String, dynamic>;
  final ar = <String, String>{};
  final en = <String, String>{};
  
  for (final entry in data.entries) {
    if (entry.value is Map) {
      en[entry.key] = entry.value['en'];
      ar[entry.key] = entry.value['ar'];
    }
  }
  
  File('c:/Users/salah/dev/labeeb/health_app/en.json').writeAsStringSync(const JsonEncoder.withIndent('  ').convert(en));
  File('c:/Users/salah/dev/labeeb/health_app/ar.json').writeAsStringSync(const JsonEncoder.withIndent('  ').convert(ar));
  
  print('Successfully created en.json and ar.json.');
}

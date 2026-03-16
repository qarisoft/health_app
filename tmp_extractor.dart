import 'dart:io';
import 'dart:convert';

void main() {
  final dir = Directory('c:/Users/salah/dev/labeeb/health_app/lib');
  // Regex to match common UI string usages
  final regex = RegExp(r'''(?:Text\s*\(\s*|hintText\s*:\s*|labelText\s*:\s*|tooltip\s*:\s*|message\s*:\s*|label\s*:\s*)(?:const\s+)?(?:Text\s*\(\s*)?(['"])(.+?)\1''');

  final strings = <String>{};

  for (final entity in dir.listSync(recursive: true)) {
    if (entity is File && 
        entity.path.endsWith('.dart') && 
        !entity.path.endsWith('.g.dart') && 
        !entity.path.endsWith('.freezed.dart') &&
        !entity.path.contains('app_localizations')) {
      final content = entity.readAsStringSync();
      final matches = regex.allMatches(content);
      for (final match in matches) {
        final str = match.group(2);
        if (str != null && str.trim().isNotEmpty && !str.contains(r'$')) {
          strings.add(str);
        }
      }
    }
  }

  File('c:/Users/salah/dev/labeeb/health_app/extracted_strings.json').writeAsStringSync(
    const JsonEncoder.withIndent('  ').convert(strings.toList())
  );
  print('Extracted ${strings.length} strings.');
}

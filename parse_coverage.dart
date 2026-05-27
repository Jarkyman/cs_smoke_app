// ignore_for_file: avoid_print
import 'dart:io';

void main() {
  final file = File('coverage/lcov.info');
  if (!file.existsSync()) return;

  final lines = file.readAsLinesSync();
  int totalHits = 0;
  int totalLines = 0;

  String currentFile = '';
  int fileHits = 0;
  int fileLines = 0;
  
  Map<String, double> fileCoverage = {};

  for (final line in lines) {
    if (line.startsWith('SF:')) {
      currentFile = line.substring(3);
      fileHits = 0;
      fileLines = 0;
    } else if (line.startsWith('DA:')) {
      if (currentFile.contains('/l10n/app_localizations') || currentFile.contains('.g.dart') || currentFile.contains('firebase_options.dart')) {
        continue;
      }
      totalLines++;
      fileLines++;
      final parts = line.split(',');
      if (parts.length > 1 && int.parse(parts[1]) > 0) {
        totalHits++;
        fileHits++;
      }
    } else if (line == 'end_of_record') {
      if (fileLines > 0) {
        fileCoverage[currentFile] = (fileHits / fileLines) * 100;
        if (fileCoverage[currentFile]! < 80.0) {
           print('$currentFile: ${fileCoverage[currentFile]!.toStringAsFixed(2)}% ($fileHits/$fileLines)');
        }
      }
    }
  }

  print('\nTotal Coverage: ${((totalHits / totalLines) * 100).toStringAsFixed(2)}% ($totalHits/$totalLines)');
}

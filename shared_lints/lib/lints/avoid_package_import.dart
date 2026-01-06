import 'dart:io';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/error/error.dart' hide LintCode;
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart';

String get getProjectName {
  final pubspecFile = File('pubspec.yaml');
  if (pubspecFile.existsSync()) {
    final yamlContent = loadYaml(pubspecFile.readAsStringSync());
    return yamlContent['name'] ?? 'unknown_project';
  }
  return 'unknown_project';
}

class AvoidPackageImport extends DartLintRule {
  AvoidPackageImport()
      : super(
    code: LintCode(
      name: 'restrict_package_import',
      problemMessage:
      'Do not use package imports for local files. Use relative imports instead.',
      correctionMessage: 'Use relative imports (../..) instead of package:$getProjectName/',
    ),
  );

  @override
  void run(
      CustomLintResolver resolver,
      ErrorReporter reporter,
      CustomLintContext context,
      ) async {
    final result = await resolver.getResolvedUnitResult();

    for (final directive in result.unit.directives) {
      if (directive is ImportDirective) {
        final uri = directive.uri.stringValue ?? '';
        if (uri.startsWith('package:$getProjectName/')) {
          reporter.reportError(
            AnalysisError.forValues(
              source: resolver.source,
              offset: directive.offset,
              length: directive.length,
              errorCode: code,
              message:
              'Do not use package imports for local files. Use relative imports instead.',
              correctionMessage:
              'Use relative imports (../..) instead of package:$getProjectName/...',
              contextMessages: const [],
            ),
          );
        }
      }
    }
  }

  @override
  List<Fix> getFixes() {
    return [
      ReplacePathFix(),
    ];
  }
}

class ReplacePathFix extends DartFix {
  @override
  void run(
      CustomLintResolver resolver,
      ChangeReporter reporter,
      CustomLintContext context,
      AnalysisError analysisError,
      List<AnalysisError> others,
      ) async {
    // Get the resolved unit to work with the AST.
    final result = await resolver.getResolvedUnitResult();
    // Find the ImportDirective node corresponding to the error offset.
    final node = result.unit.directives.where((d) => d.offset == analysisError.offset).firstOrNull;
    if (node is! ImportDirective) return;

    final importUri = node.uri.stringValue;
    if (importUri == null || !importUri.startsWith('package:$getProjectName/')) return;

    // Remove the package import prefix.
    final targetPathPart = importUri.replaceFirst('package:$getProjectName/', '');

    // Determine file paths.
    final currentFilePath = resolver.source.fullName;
    // Assuming that package: imports reference files in the lib/ folder.
    // Determine the project root by assuming the current file is under lib/.
    final projectRoot = p.dirname(p.dirname(currentFilePath));
    final targetAbsolutePath = p.normalize(p.join(projectRoot, 'lib', targetPathPart));
    final currentDir = p.dirname(currentFilePath);

    // Calculate the relative path from the current file to the target file.
    String relativePath = p.relative(targetAbsolutePath, from: currentDir);
    // Ensure the relative path starts with './' or '../'
    if (!relativePath.startsWith('.') && !relativePath.startsWith('/')) {
      relativePath = './$relativePath';
    }
    // Normalize path for Dart (always use forward slashes).
    final fixedUri = relativePath.replaceAll('\\', '/');

    // Create a fix to update the import URI.
    reporter.createChangeBuilder(
      message: 'Replace package import with relative import',
      priority: 0,
    );
  }
}
